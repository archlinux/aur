# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-segment-geospatial
_pkgname=segment-geospatial
pkgver=0.10.8
pkgrel=1
pkgdesc="A Python package for segmenting geospatial data with the Segment Anything Model (SAM)"
arch=('any')
url="https://github.com/opengeos/segment-geospatial"
license=('MIT')
depends=('python' 'python-segment-anything-py' 'python-rasterio')
makedepends=('git' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/opengeos/segment-geospatial/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c06b69ca6c24db6bdb99646b9b796301d9721461ab767720e53374a1964026d0')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  # rm -r "${pkgdir}${site_packages}/${_base}"/tests/
  # mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
