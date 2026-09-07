# Current Maintainer: necklace <ns@nsz.no>
# Original Packager: necklace <ns@nsz.no>

pkgname=grok-jpeg2000
pkgver=20.4.4
pkgrel=1
pkgdesc="A high performance open source JPEG 2000 codec."
arch=(x86_64)
license=('AGPL')
url="https://github.com/GrokImageCompression/grok"
makedepends=('cmake')
depends=('zlib' 'libpng' 'libtiff' 'lcms2' 'libjpeg-turbo' 'jbigkit' 'cli11')
optdepends=('python-sphinx' 'doxygen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GrokImageCompression/grok/releases/download/v$pkgver/source-full.tar.gz")
sha256sums=('9a71e432f98d0e4283b77aa270ee6600edd2928e23dda3b5bd4d612f32271386')

prepare() {
  cd "${srcdir}"
  mkdir -p build
}

build() {
  cd "${srcdir}/build"

  cmake "../grok-v${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DGRK_BUILD_LIBPNG:BOOL=OFF \
    -DGRK_BUILD_LIBTIFF:BOOL=OFF \
    -DGRK_BUILD_LCMS2:BOOL=OFF \
    -DGRK_BUILD_JPEG:BOOL=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}


package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  install -m644 -d "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/grok-jpeg2000/LICENSE"
}
