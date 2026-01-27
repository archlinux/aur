# Current Maintainer: necklace <ns@nsz.no>
# Original Packager: necklace <ns@nsz.no>

pkgname=grok-jpeg2000
pkgver=20.0.5
pkgrel=1
pkgdesc="A high performance open source JPEG 2000 codec."
arch=(x86_64)
license=('AGPL')
url="https://github.com/GrokImageCompression/grok"
makedepends=('cmake')
depends=('zlib' 'libpng' 'libtiff' 'lcms2' 'libjpeg' 'jbigkit' 'cli11')
optdepends=('python-sphinx' 'doxygen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GrokImageCompression/grok/releases/download/v$pkgver/source-full.tar.gz")
sha256sums=('7c34c4cd2b545d3bbd05b13c8e57db6a27dfd301613932f26aac3b4bd5397a8b')

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
