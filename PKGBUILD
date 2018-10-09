# Maintainer: David Runge <dave@sleepmap.de>
_name=click-repl
pkgname=python-click-repl
pkgver=0.1.5
pkgrel=1
pkgdesc="Subcommand REPL for click apps"
arch=('any')
url="https://github.com/click-contrib/click-repl"
license=('MIT')
depends=('python-click' 'python-prompt_toolkit' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('19e309ca24348f0b8fd7874b2ec41cd6f2e5b0c52351b17f7fc768699cb499b149385a0d968134d33bdcf55c794be30574a560452dcbebcd87a74c18cbb4df19')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

# no tests in pypi source:
# https://github.com/click-contrib/click-repl/issues/49
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
