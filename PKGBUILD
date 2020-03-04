# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot-audio
pkgver=0.2.0
pkgrel=1
pkgdesc="A high-quality audio editing and playback library used by libopenshot."
arch=('x86_64')
url="https://openshot.org/"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('alsa-lib' 'cmake' 'doxygen' 'freetype2' 'libx11')
provides=('libopenshot-audio.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/libopenshot-audio/archive/v$pkgver.tar.gz")
sha512sums=('c014a619f32283a8482e0df9224785610a9563073fbd98378367f28f713afa1dc9873d212a40352d3c96040004344f16084e5fe30e4cf64c57309f96e66068c1')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
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
