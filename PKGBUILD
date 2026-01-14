# Maintainer: Sergey Safonov <spoof-arch@spoofa.info>
# Maintainer: Luca D'Amico <damico.luca91@live.it>

pkgname=python-dissect.cstruct
_name=${pkgname#python-}
_safename=${_name//./_}
pkgver=4.7
pkgrel=1
pkgdesc="A Dissect module implementing a parser for C-like structures."
arch=('any')
url="https://github.com/fox-it/$_name"
license=('Apache-2.0')
depends=('python>=3.10')
makedepends=(
    'python-installer'
    'python-setuptools>=77.0.0' 
    'python-setuptools-scm>=6.4.0'
    'python-tox>=4.27'
)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_safename/$_safename-$pkgver.tar.gz")
sha256sums=('4bf821a381312b9b2fdefea307f7e33548158d39d7d154f1b3007472c51a1fc4')

build() {
    cd "$_safename-$pkgver"
    tox -e build
}

package() {
    cd "$_safename-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
    cd "$_safename-$pkgver"
    tox
}
