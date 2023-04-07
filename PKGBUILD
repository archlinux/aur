# Maintainer: David Runge <dvzrv@archlinux.org>

_name=click-repl
pkgname=python-click-repl
pkgver=0.2.0
pkgrel=4
pkgdesc="Subcommand REPL for click apps"
arch=('any')
url="https://github.com/click-contrib/click-repl"
license=('MIT')
depends=('python-click' 'python-prompt_toolkit' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
# https://github.com/click-contrib/click-repl/issues/49
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/click-contrib/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('888ef2d4082cbecbdab70d707296b20d3dcc0a13fe06ef103fbe04a3f29381fe0f3284c2eb38c6d3eb8b026063cba470a519524e98b9eadd06a5946c669ffc3b')
b2sums=('b02c7d858971f655ba880c6f66ff0a5c1b3c1aeb83782807c04d862430841761caa8a7a72d2d110a9706272cf2cd818b6976db14315c885bea95e8ef991ef9df')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -v
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --root="${pkgdir}"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
