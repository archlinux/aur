# Current Maintainer: necklace <ns@nsz.no>
# Original Packager: necklace <ns@nsz.no>

pkgname=grok-jpeg2000
pkgver=9.7.5
pkgrel=2
pkgdesc="A high performance open source JPEG 2000 codec."
arch=(x86_64)
license=('AGPL')
url="https://github.com/GrokImageCompression/grok"
makedepends=('cmake')
depends=('zlib' 'libpng' 'libtiff' 'lcms2' 'libjpeg' 'jbigkit')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GrokImageCompression/grok/archive/v$pkgver.tar.gz")
sha256sums=('f5e61ba2f016b2239fadccf03a12bcaeb9b88f63e5bd640b5aae4f8ee698f5f5')

prepare() {
  cd "${srcdir}"
  mkdir -p build
}

build() {
  cd "${srcdir}/build"

  cmake "../grok-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_STATIC_LIBS=OFF \
    -DBUILD_DOC=ON \
    -DBUILD_TESTING=OFF
  make
}


package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/grok-jpeg2000"
  mv "${pkgdir}"/usr/share/doc/GROK/LICENSE "${pkgdir}"/usr/share/licenses/grok-jpeg2000

}
