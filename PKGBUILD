# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=gl4es
pkgver=1.1.6
pkgrel=1
pkgdesc='OpenGL 2.1/1.5 to GL ES 2.0/1.1 translation library'
arch=($CARCH)
url='https://github.com/ptitSeb/gl4es'
license=('MIT')
depends=('glibc' 'libx11')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ptitSeb/gl4es/archive/v${pkgver}.tar.gz")
sha256sums=('dca1d897e492a0cb163a3390f273fbd4cc7ab2367d236d93dc2b321ce108ed5c')
build() {
  cd ${pkgname}-${pkgver}
  cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd ${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install
  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
