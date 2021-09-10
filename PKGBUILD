# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot-audio
pkgver=0.2.1
pkgrel=1
pkgdesc="A high-quality audio editing and playback library used by libopenshot."
arch=('x86_64')
url="https://openshot.org/"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('alsa-lib' 'cmake' 'doxygen' 'freetype2' 'libx11' 'python')
provides=('libopenshot-audio.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/libopenshot-audio/archive/v$pkgver.tar.gz")
sha512sums=('2d9182f6e25df188a4502cea331de15363e4fa013e7f6d173602326cce60530d317300682d057bf03c7af6fbdc930a76226c3c5b135ef040145c0c997bc394d6')
b2sums=('bde891328991050497f284b1ac9367c2102af9ec224fe0fb36db8bd80432aa86f5d189e74a9e1b3cfb3f8f1385c9b0a07f484210463e17f1e5b698b88d043dce')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  depends+=('libasound.so')
  cd "${pkgname}-${pkgver}"
  make VERBOSE=1 DESTDIR="${pkgdir}" install -C build
  install -vDm 644 {AUTHORS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
