# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-geolinks
_pkgname=geolinks
pkgver=0.2.3
pkgrel=1
pkgdesc=" Utilities to deal with geospatial links "
arch=('any')
url="https://github.com/geopython/geolinks"
license=('MIT')
depends=('python-click')
makedepends=('git' 'python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('27e9d766d4e2d7200c284f481b0000c5fa0aabafb0445fd2ff2fb142a9510b9b')

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
