# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=cpprestsdk
pkgver=2.10.8
pkgrel=2
pkgdesc="A cross-platform, modern, and asynchronous library that enables developers to access and author connected applications"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/Microsoft/cpprestsdk/"
license=('Apache')
depends=('boost' 'websocketpp' 'openssl>=1.0.0')
makedepends=('cmake>=2.6.0')
conflicts=('casablanca' 'casablanca-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Microsoft/cpprestsdk/archive/v${pkgver}.tar.gz")
sha512sums=('d80a7db59cfe81d8e0c645acff7bcc2ed9ad04e2f3d14dc4ab2a624290d0ea43a2c7adebb54b52a166fd07375352cfd5f1fe244d7c062ce94ec60b977437b2df')

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
    -DCMAKE_INSTALL_PREFIX=/usr
  make  -j`nproc`
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ThirdPartyNotices.txt ${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices
  mv "${pkgdir}"/usr/lib64 "${pkgdir}"/usr/lib
}
