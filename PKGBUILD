# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=python-textual
pkgver=0.1.11
pkgrel=1
pkgdesc='TUI (Text User Interface) framework for Python inspired by modern web development.'
arch=(any)
url='https://github.com/willmcgugan/textual'
license=('MIT')
depends=('python-rich' 'python-pyfiglet')
makedepends=('python-pip' 'python-poetry')
source=("https://github.com/willmcgugan/textual/archive/v${pkgver}/textual-${pkgver}.tar.gz")
md5sums=('50a91bd4519dcffd00d3bb48d2e1da54')

build() {
  cd textual-${pkgver}
  poetry build --format wheel
}

package() {
  cd textual-${pkgver}
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
