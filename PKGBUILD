# Maintainer: Lubosz Sarnecki <lubosz ! gmail ! com>
# Arch Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte-git
pkgver=3.11.91+26+g7345d8f
pkgrel=1
pkgdesc="Menu editor for gnome. Git version using Python 3."
arch=(any)
license=('LGPL')
url="https://www.gnome.org"
depends=('gnome-menus' 'python-gobject' 'gtk3')
makedepends=('intltool' 'libxslt' 'docbook-xsl' 'git' 'gnome-common')
provides=("alacarte="$pkgver)
replaces=("alacarte")
conflicts=("alacarte")
source=('git+https://gitlab.gnome.org/lubosz/alacarte.git#branch=python3')
sha256sums=('SKIP')

pkgver() {
  cd alacarte
  git describe --long | sed 's/-/+/g'
}

build() {
  cd alacarte
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var PYTHON=/usr/bin/python3
  make
}

package() {
  cd alacarte
  make DESTDIR="$pkgdir" install
  python3 -m compileall "$pkgdir"/usr/lib/python3.8/site-packages/Alacarte/
}
