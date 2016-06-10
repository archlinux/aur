# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=cpprestsdk
pkgver=2.8.0
pkgrel=2
pkgdesc="A cross-platform, modern, and asynchronous library that enables developers to access and author connected applications"
arch=('i686' 'x86_64')
url="https://github.com/Microsoft/cpprestsdk/"
license=('Apache')
depends=('boost' 'websocketpp' 'openssl>=1.0.0')
makedepends=('cmake>=2.6.0')
conflicts=('casablanca' 'casablanca-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Microsoft/cpprestsdk/archive/v${pkgver}.tar.gz")
sha512sums=('ee104199511da130136ef4ebbb4cf46b6199d841e8883069c5d9c05dc54b1221bf9fdc99e9067af082ce43c98213c3f92aee6e544eafe8815244f115aeb058d2')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver}/Release \
    -DBUILD_TESTS=OFF \
    -DBUILD_SAMPLES=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  cd ${pkgname}-${pkgver}
  install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ThirdPartyNotices.txt ${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices
}
