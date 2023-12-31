# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=gl4es
pkgver=1.1.4
pkgrel=1
pkgdesc='OpenGL 2.1/1.5 to GL ES 2.0/1.1 translation library'
arch=('armv7h' 'x86_64')
url='https://github.com/ptitSeb/gl4es'
license=('MIT')
depends=('glibc' 'libx11')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ptitSeb/gl4es/archive/v${pkgver}.tar.gz")
sha256sums=('b565e717c7d192e936bda25f3cb90ad8db398af56414ec08294b6716574c1a6d')
build() {
  cd ${pkgname}-${pkgver}
  cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd ${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install
  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
