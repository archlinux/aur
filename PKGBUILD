# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-segment-geospatial
_pkgname=segment-geospatial
pkgver=0.12.2
pkgrel=1
pkgdesc="A Python package for segmenting geospatial data with the Segment Anything Model (SAM)"
arch=('any')
url="https://github.com/opengeos/segment-geospatial"
license=('MIT')
depends=('python' 'python-segment-anything-py' 'python-rasterio' 'python-rioxarray' 'python-scikit-image' 'python-scikit-learn')
makedepends=('git' 'python-setuptools')
# Temporary workaround with git version
source=("git+$url.git#tag=v$pkgver")
#source=("$_pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.zip")
#sha256sums=('711fc63d58e3b6aff81468fcba583e20c2ead2b501c293912b2aee2e436c222c')
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
#"-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
#"-$pkgver"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  # rm -r "${pkgdir}${site_packages}/${_base}"/tests/
  # mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
