# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python-sql
pkgver=1.5.0
pkgrel=1
pkgdesc="Library to write SQL queries"
arch=(any)
url="https://${pkgname}.tryton.org"
license=(BSD)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://foss.heptapod.net/tryton/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('6e62370e3637f43a9a30c06e5acf3ef164761cc0baaa11c6816c6118524e4b6ab2ed88be971277fde42154b86e778c29efb6f0a03765c28a68004a2a441f563d')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
