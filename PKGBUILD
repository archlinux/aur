# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=1.8.0
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://github.com/flatpak/xdg-desktop-portal"
arch=(x86_64)
license=(LGPL)
depends=(glib2 pipewire fuse2 geoclue2)
makedepends=(python xmlto docbook-xsl git flatpak libportal)
checkdepends=(epiphany gedit gvfs)
_commit=9a2582d035a397efbb330c53f893d5649c1fd749  # tags/1.8.0^0
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
  depends+=(xdg-desktop-portal-impl)
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
