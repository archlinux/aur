# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=redkite
pkgver=0.6
pkgrel=1
pkgdesc="A small cross-platform GUI toolkit for C++ 11/14"
arch=('x86_64')
url="https://github.com/quamplex/redkite"
license=('GPL3')
depends=('cairo')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/quamplex/redkite/archive/v$pkgver.tar.gz")
sha512sums=('2b74163ac3e66cdba39daee81c646676b9d32a57821dd851a077f04eafa5e076c2fa2e54b46cb0e1d6506d840c527868e15d863dec64271ee436f497185853c2')


build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
  install -vDm 644 ../examples/* \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
  install -vDm 644 ../README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
