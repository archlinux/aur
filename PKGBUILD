# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=cpprestsdk
pkgver=2.10.13
pkgrel=1
pkgdesc="A cross-platform, modern, and asynchronous library that enables developers to access and author connected applications"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/Microsoft/cpprestsdk/"
license=('Apache')
depends=('boost' 'websocketpp' 'openssl>=1.0.0')
makedepends=('cmake>=2.6.0')
conflicts=('casablanca' 'casablanca-git' 'cpprestsdk-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Microsoft/cpprestsdk/archive/v${pkgver}.tar.gz")
sha512sums=('43e60ee1266e0009f04452736a1b5127439d54416060f81544613007a8bcc084705bedd482ec3519140e79a6f56bddba6d25e9752228595bb8f83ce560ae39b8')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  mkdir -p build
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  cmake ../Release \
    -DBUILD_TESTS=OFF \
    -DBUILD_SAMPLES=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make  -j`nproc`
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ThirdPartyNotices.txt ${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices
}
