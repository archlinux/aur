# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-compreffor'
_pkgname='compreffor'
pkgver='0.5.0'
pkgrel=1
pkgdesc="A CFF table suroutinizer for FontTools."
url="https://github.com/googlefonts/compreffor"
checkdepends=('python-pytest')
depends=('python-fonttools')
makedepends=('cython' 'python-setuptools')
optdepends=()
license=('Apache')
arch=('x86_64')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('b804999e0c256094e28a9cbb9306f6031b7cf6884bbb98fd44ad70eed6c4c2fd')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

check() {
    cd "$_pkgname-$pkgver"
    python setup.py build_ext --inplace
    PYTHONPATH=src/python pytest src/python/compreffor/test
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
