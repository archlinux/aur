# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python-sql
pkgver=1.4.2
pkgrel=1
pkgdesc="Library to write SQL queries"
arch=(any)
url="https://${pkgname}.tryton.org"
license=(BSD)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('3d9d075ba8ed9c9214bc40aa0fac485d20446397d2dd7b769f0512c350b1f2c8b8985e47f6667e97c6cfc0e9130f9d2999f5625bfc46ee163d7deaacfd52b4c2')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
