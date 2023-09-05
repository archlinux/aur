# Maintainer: Butui Hu <hot123tea123@gmail.com>

_name=imagecodecs
pkgname=python-imagecodecs
pkgver=2023.9.4
pkgrel=2
pkgdesc='Image transformation, compression, and decompression codecs'
arch=('x86_64')
url='https://github.com/cgohlke/imagecodecs'
license=('BSD')
depends=(
  blosc
  blosc2
  brotli
  brunsli
  cfitsio
  charls
  jxrlib
  lcms2
  lerc
  libaec
  libavif
  libdeflate
  libheif
  libjpeg-turbo
  libjxl
  libmng
  libpng
  libtiff
  libwebp
  lzfse
  openjpeg2
  python-imread
  python-numpy
  snappy
  zfp
  zlib-ng
  zopfli
)
makedepends=(
  cython
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("${_name}-${pkgver}.tar.gz::https://github.com/cgohlke/imagecodecs/archive/v${pkgver}.tar.gz"
        "0001.fix-deps.patch"
)
sha256sums=('b8b4e1b1691123aa9b5e8e4686a0805e1215eae3da5949697b7fc925ad2e90e0'
            '53fbec4857eb1bfc306cafd4835934ac7371e17a82b5e66daf21b2668d3b0b29')

prepare() {
  cd "${_name}-${pkgver}"
  patch -p1 -i "${srcdir}/0001.fix-deps.patch"
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:ts=2:sw=2:et:
