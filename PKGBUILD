# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=0.7
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://github.com/flatpak/xdg-desktop-portal"
arch=(i686 x86_64)
license=(LGPL2.1)
depends=(glib2)
makedepends=(python flatpak xmlto docbook-xsl git)
_commit=db9c5060b9483ec9493811449d21001826dc0dc2  # tags/0.7^0
source=("git+https://github.com/flatpak/xdg-desktop-portal#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make 
}

check() {
  cd $pkgname
  make check
}

package() {
  depends+=('xdg-desktop-portal-impl')
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
