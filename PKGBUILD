# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-segment-geospatial
_pkgname=segment-geospatial
pkgver=0.11.2
pkgrel=1
pkgdesc="A Python package for segmenting geospatial data with the Segment Anything Model (SAM)"
arch=('any')
url="https://github.com/opengeos/segment-geospatial"
license=('MIT')
depends=('python' 'python-segment-anything-py' 'python-rasterio')
makedepends=('git' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/opengeos/segment-geospatial/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('db9ff083070b3ff6c3e9d229d943a7c2bc6f5b16e279ddf9bd0fdafc9274e4cc')

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
