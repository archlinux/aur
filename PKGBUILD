# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-rio-cogeo
_pkgname=rio-cogeo
pkgver=5.3.6
pkgrel=1
pkgdesc="Cloud Optimized GeoTIFF creation and validation plugin for rasterio"
arch=('any')
url="https://github.com/cogeotiff/rio-cogeo"
license=('BSD-3')
depends=('python-rasterio' 'python-morecantile' 'python-pydantic' 'python-click')
makedepends=('git' 'python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f0f8fb3f84d9f8b95f8b5f2225eb061defddd7932d022e174969c14ae9c9bbe1')

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
