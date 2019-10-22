# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=1.5.1
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://github.com/flatpak/xdg-desktop-portal"
arch=(x86_64)
license=(LGPL2.1)
depends=(glib2 pipewire fuse2 geoclue2)
makedepends=(python xmlto docbook-xsl git flatpak libportal)
_commit=c9f727e26ce1ce7c504a92bf59d0fe88e824918f  # tags/1.5.1^0
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
  ./configure --prefix=/usr --libexecdir=/usr/lib --enable-pipewire
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
