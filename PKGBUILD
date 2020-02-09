# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot-audio
pkgver=0.1.9
pkgrel=1
pkgdesc="A high-quality audio editing and playback library used by libopenshot."
arch=('x86_64')
url="https://openshot.org/"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('alsa-lib' 'cmake' 'doxygen' 'freetype2' 'libx11')
provides=('libopenshot-audio.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/libopenshot-audio/archive/v$pkgver.tar.gz")
sha512sums=('8113bf6f5747b0f72391a30560f49c97b13c68994097170797cdfeb44813791b90b073a6caffc91ba1a2153a41b86e8c1b188de0daaec3f5c785013c049c1b4d')

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
