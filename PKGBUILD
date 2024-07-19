# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_name=varname
pkgname=python-varname
pkgver=0.13.3
pkgrel=1
pkgdesc="A Python library to retrieve variable names from functions or classes"
arch=('any')
url="https://github.com/pwwang/${pkgname}"
license=('MIT')
depends=('python' 'python-executing')
optdepends=('python-asttokens' 'python-pure-eval')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=(${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('3c6004fc0fee7c10f54c50c08351b53178fde87c92040c0715363662600fdd0743168ed27128623dee39c9dea7fd38cc6b71373c1e562bbae89eb78b86349ac5')

build() {
  cd "${pkgname}-${pkgver}"
	## skip dependency check because of pinned deps
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
