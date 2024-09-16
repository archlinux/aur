# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=exam-terminal
pkgdesc="Terminal/console based exam, test, or quiz tool for educators and learners"
pkgver=0.2.12
pkgrel=1
arch=(any)
url="https://github.com/ismet55555/${pkgname}"
license=(Apache-2.0)
depends=(python-fpdf2 python-requests python-pyaml python-click)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname//-/_}-${pkgver}.tar.gz)
sha512sums=('97c46fbab36f5078a185f3d3340caeab1bea2a1e0203305c9b60740af80890d5fae5790f9cac4927f711c7514959add229f5496a1f902e11fcf4b0fcee8f6526')

build() {
  cd ${pkgname//-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname//-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

}
