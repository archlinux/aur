# Current Maintainer: necklace <ns@nsz.no>
# Original Packager: necklace <ns@nsz.no>

pkgname=grok-jpeg2000
pkgver=20.4.6
pkgrel=1
pkgdesc="A high performance open source JPEG 2000 codec."
arch=(x86_64)
license=('AGPL-3.0-only')
url="https://github.com/GrokImageCompression/grok"
makedepends=('cmake' 'zlib' 'jbigkit' 'cli11')
depends=('libgcc' 'libstdc++' 'libpng' 'libtiff' 'lcms2' 'libjpeg-turbo')
provides=('libgrokj2k.so' 'libgrokj2kcodec.so')
optdepends=('python-sphinx' 'doxygen')
options=('staticlibs' '!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GrokImageCompression/grok/releases/download/v$pkgver/source-full.tar.gz")
sha256sums=('cd0239bc26f774174d3e12b37316175e3a6610ffe6c052734ae067dcf888c50c')

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
  install -Dm644 "${srcdir}/grok-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/grok-jpeg2000/LICENSE"
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
