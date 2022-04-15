# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=1.14.3
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://github.com/flatpak/xdg-desktop-portal"
arch=(x86_64)
license=(LGPL)
depends=(glib2 pipewire fuse3 geoclue2 rtkit systemd)
makedepends=(python xmlto docbook-xsl git flatpak libportal)
options=(debug)
_commit=9826455119e5daee241cb8f991c2acac079f1db3  # tags/1.14.3
source=("git+https://github.com/flatpak/xdg-desktop-portal#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
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

package() {
  depends+=(xdg-desktop-portal-impl)

  cd $pkgname
  make DESTDIR="$pkgdir" install
}
