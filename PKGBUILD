# Maintainer: David Runge <dave@sleepmap.de>
_name=click-repl
pkgname=python-click-repl
pkgver=0.1.4
pkgrel=2
pkgdesc="Subcommand REPL for click apps"
arch=('any')
url="https://github.com/click-contrib/click-repl"
license=('MIT')
depends=('python-click' 'python-prompt_toolkit' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/click-contrib/${_name}/master/LICENSE")
sha512sums=('e7823f4ad4a091e5b0fe452f2fbfccb16dca8948cf8780a40345d38dbb0ea16166812eec82de609d2fbc25911e287b4386dfbe84104c911172e2e1e5e580e8d8'
            '537efc15653eae847ab9418e36724a67cd27ad3b7adf8d925b24b209975e5289558b61209348c421a9b2abb180b86504488f2c3929b42e38500496de99edc339')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

# no tests in 0.1.4 yet
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
  install -vDm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
