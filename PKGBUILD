# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>

_name=varname
pkgname=python-varname
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python library to retrieve variable names from functions or classes"
arch=('any')
url="https://github.com/pwwang/${pkgname}"
license=('MIT')
depends=('python' 'python-executing' 'python-typing_extensions')
optdepends=('python-pure-eval' 'python-asttokens')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pure-eval' 'python-asttokens')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')

source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
b2sums=('6eed0898e2d3c8733376ec9ad137ba08851077cb81cd82e8f24235959c6b1c2f961e8c6179ad612d7850e9820e0aa24165c5f79a5637449e449d073f3e5a0813')

build() {
  cd "${pkgname}-${pkgver}"
  ## skip dependency check because of pinned deps
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "${pkgname}-${pkgver}"
  pytest
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

