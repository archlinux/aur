# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python-sql
pkgver=1.8.1
pkgrel=1
pkgdesc="Library to write SQL queries"
arch=(any)
url="https://${pkgname}.tryton.org"
license=(BSD)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://foss.heptapod.net/tryton/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('66f9c376bb1caff32017e8d8cddfcfb3bbeb5baeb3849250c59115776ad5220e4c0bed699cc89e751bc4d597d09b9d3d75fadbd3e8c8ac86f4b6a2ef89c107af')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
