# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=1.7.2
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://github.com/flatpak/xdg-desktop-portal"
arch=(x86_64)
license=(LGPL2.1)
depends=(glib2 pipewire fuse2 geoclue2)
makedepends=(python xmlto docbook-xsl git flatpak libportal)
checkdepends=(epiphany gedit gvfs)
_commit=309a1fc0cf2fb32cceb91dbc666d20cf0a3202c2  # tags/1.7.2^0
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
