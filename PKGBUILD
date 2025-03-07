# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-rio-cogeo
_pkgname=rio-cogeo
pkgver=5.4.1
pkgrel=1
pkgdesc="Cloud Optimized GeoTIFF creation and validation plugin for rasterio"
arch=('any')
url="https://github.com/cogeotiff/rio-cogeo"
license=('BSD-3')
depends=('python-rasterio' 'python-morecantile' 'python-pydantic' 'python-click')
makedepends=('git' 'python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fdf3f49ff9299bc6b6df07ebae436e18cd832a31f82c1452929c1aee038a65ed')

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
