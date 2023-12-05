# Maintainer: Bart Libert <bart dot aur at libert dot email>
# Contributor: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=cpprestsdk
pkgver=2.10.19
pkgrel=1
pkgdesc="A cross-platform, modern, and asynchronous library that enables developers to access and author connected applications"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/Microsoft/cpprestsdk/"
license=('Apache')
depends=('openssl>=1.0.0' 'zlib' 'gcc-libs' 'boost' 'glibc')
makedepends=('cmake>=2.6.0' 'websocketpp')
conflicts=('casablanca' 'casablanca-git' 'cpprestsdk-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Microsoft/cpprestsdk/archive/v${pkgver}.tar.gz")
sha512sums=('2d8fa213f492236e2fd912349bf81951c1e618dd8eab4f665f909d75b5aeeda18b8f70dce3a4db50d67bdb3e372888132481701163de6c27716dfd750bff9781')

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
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWERROR=OFF
  make  -j`nproc`
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ThirdPartyNotices.txt ${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices
}
