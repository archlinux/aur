# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=babelfont
pkgname=python-$_pipname
pkgver=2.0.1
pkgrel=1
pkgdesc='Interrogate and manipulate UFO, TTF and OTF fonts with a common interface'
arch=('any')
url="https://github.com/simoncozens/$_pipname"
license=('MIT')
_py_deps=('defcon'
          'fontparts'
          'fonttools')
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('5678699d6f405dd0809dea66c0ac5ee90643fc894b64970fa1762e446b0219a8')

prepare() {
    cd "$_pipname-$pkgver"
    sed -i setup.py \
        -e '/history_file/d' \
        -e '/long_description/s/=.*$/=readme,/'
}

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
