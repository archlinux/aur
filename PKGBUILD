# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python-sql
pkgver=1.4.0
pkgrel=2
pkgdesc="Library to write SQL queries"
arch=(any)
url="https://${pkgname}.tryton.org"
license=('custom')
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('7f68a180e6298d3a681c04c6f8551bf09bed73762ee8f2ae13c66572675be7d94c8bd9e1f09959e59f26484bfa6e4946536ab25dc67c3781390bbebeabd2e135')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
