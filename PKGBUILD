# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=n-ipv4ll
pkgver=1
pkgrel=1
pkgdesc="IPv4 Link-Local Address Selection"
url="https://github.com/nettools/n-ipv4ll"
license=('LGPL2.1' 'Apache')
arch=(x86_64)
depends=(glibc)
makedepends=(meson pkgconf)
_tag=2100b256b3d4e09fbc5d6a3e82f3d986b6bc4081 #20180929
source=("git+https://github.com/nettools/n-ipv4ll.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//g; s/-/+/g'
}

build() {
  rm -rf build
  arch-meson $pkgname build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

