# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python-sql
pkgver=1.7.0
pkgrel=1
pkgdesc="Library to write SQL queries"
arch=(any)
url="https://${pkgname}.tryton.org"
license=(BSD)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://foss.heptapod.net/tryton/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('1b4dd2cd1435d27d193806cedbaac036099c71aad029dfb0b0b75c6536dc2aece1713c7f4251b7e90812ca7050e1a091800ec5ac99ba78abfa7840f47a30b2fb')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
