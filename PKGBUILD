# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

pkgname=python-terminaltables3
_pyname=terminaltables3
pkgver=4.1.0
pkgrel=1
pkgdesc="Easily draw tables in terminal/console applications from a list of lists of strings"
arch=('any')
url="https://github.com/matthewdeanmartin/${_pyname}"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-pytest-snapshot' 'python-colorama' 'python-hypothesis' 'python-termcolor' 'python-colorclass')
source=("${_pyname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6cfefc1e7e5de535d28f848bc2e80141960a2fbc610ef2735b9ae0ccade227b6')

build() {
  cd "${_pyname}-${pkgver}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${_pyname}-${pkgver}"

  FORCE_COLOR=1 pytest
}

package() {
  cd "${_pyname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 example*.py -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}
