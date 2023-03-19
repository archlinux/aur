# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

_name=libnsl
pkgname=lib32-libnsl
pkgver=2.0.0
pkgrel=2
pkgdesc='Public client interface library for NIS(YP)'
arch=(x86_64)
url=https://github.com/thkukuk/libnsl
license=(LGPL2.1)
depends=(
  lib32-glibc
  lib32-libtirpc
  "libnsl=${pkgver}"
)
provides=(libnsl.so)
source=($url/archive/v$pkgver/$_name-v$pkgver.tar.gz)
sha512sums=('86a7738707a3e4e56b60c8de0445fb576e66148bc12fa2a6aab422ea81eb4b42be3287a12f78384acd2b8bfb3885e9a0ce4f7328f078da3a5099acb66a35a935')
b2sums=('e16bba0d64afa3c1473be831fa9fa743e88323091a4ee62436383169d282b1ad6deab3ff1f9462828c88e443a4b9b913ac18b36c68664593a6a80dae25988b7d')

prepare() {
  cd $_name-$pkgver
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --libdir=/usr/lib32
    --disable-static
  )

  cd $_name-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkg-config'

  ./configure "${configure_options[@]}"
  make
}

package() {
  make DESTDIR="$pkgdir" install -C $_name-$pkgver
  rm -rf "$pkgdir"/usr/include
}

# vim: ts=2 sw=2 et:
