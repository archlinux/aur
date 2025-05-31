# Maintainer: Lubosz Sarnecki <lubosz ! gmail ! com>
# Arch Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte-git
pkgver=3.56.0+0+gb0c7ca0
pkgrel=1
pkgdesc="Menu editor for gnome. Git version."
arch=(any)
license=('LGPL-2.0-or-later')
url="https://gitlab.gnome.org/GNOME/alacarte"
depends=(
  gdk-pixbuf2
  glib2
  gnome-menus
  gtk3
  hicolor-icon-theme
  python
  python-cairo
  python-gobject
)

makedepends=(
  docbook-xsl
  git
  libxslt
)

provides=("alacarte="$pkgver)
replaces=("alacarte")
conflicts=("alacarte")
source=('git+https://gitlab.gnome.org/GNOME/alacarte.git')
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
