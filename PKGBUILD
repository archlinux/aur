# Current Maintainer: necklace <ns@nsz.no>
# Original Packager: necklace <ns@nsz.no>

pkgname=grok-jpeg2000
pkgver=7.6.1
pkgrel=1
pkgdesc="A high performance open source JPEG 2000 codec."
arch=(x86_64)
license=('AGPL')
url="https://github.com/GrokImageCompression/grok"
makedepends=('cmake')
depends=('zlib' 'libpng' 'libtiff' 'lcms2' 'libjpeg' 'jbigkit')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GrokImageCompression/grok/archive/v$pkgver.tar.gz")
sha256sums=('f0cbbeb12052146c08b2f73ffd9424629a6192cc11bdf112d8edb2a9dd4a8310')

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
    -DBUILD_DOC=on 
  make
}


package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/grok-jpeg2000"
  mv "${pkgdir}"/usr/share/doc/GROK/LICENSE "${pkgdir}"/usr/share/licenses/grok-jpeg2000

}
