# Current Maintainer: necklace <ns@nsz.no>
# Original Packager: necklace <ns@nsz.no>

pkgname=grok-jpeg2000
pkgver=20.3.3
pkgrel=1
pkgdesc="A high performance open source JPEG 2000 codec."
arch=(x86_64)
license=('AGPL')
url="https://github.com/GrokImageCompression/grok"
makedepends=('cmake')
depends=('zlib' 'libpng' 'libtiff' 'lcms2' 'libjpeg' 'jbigkit' 'cli11')
optdepends=('python-sphinx' 'doxygen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GrokImageCompression/grok/releases/download/v$pkgver/source-full.tar.gz")
sha256sums=('2b588f23202e306e0242dd5b2c8b99648bded44f118a31e57ed5dcee75cbc549')

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
