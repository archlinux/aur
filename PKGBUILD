# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=n-acd
pkgver=1
pkgrel=1
pkgdesc="IPv4 Address Conflict Detection"
url="https://github.com/nettools/n-acd"
license=('LGPL2.1' 'Apache')
arch=(x86_64)
depends=(glibc)
makedepends=(meson pkgconf)
_tag=v1 #20180929
source=("git+https://github.com/nettools/n-acd.git#tag=$_tag")
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

