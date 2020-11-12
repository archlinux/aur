# Maintainer: David Runge <dave@sleepmap.de>
_name=click-repl
pkgname=python-click-repl
pkgver=0.1.6
pkgrel=4
pkgdesc="Subcommand REPL for click apps"
arch=('any')
url="https://github.com/click-contrib/click-repl"
license=('MIT')
depends=('python-click' 'python-prompt_toolkit' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('50576166e8eb61098b8b4e1c7db43101c226d09785a497539830addfd52a2c35b2fa7865d3cbb20559dcf2fea99801f306dcb05c177886f021a1ada188501ced')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

## no tests in pypi source:
## https://github.com/click-contrib/click-repl/issues/49
#check() {
#  cd "$pkgname-$pkgver"
#  export PYTHONPATH="${PYTHONPATH}:${PWD}/build/lib/"
#  py.test
#}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
