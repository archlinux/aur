# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-skia-pathops
_pkgname=${pkgname#python-}
pkgver=0.6.0.post1
pkgrel=1
pkgdesc='Python bindings for the Skia library’s Path Ops'
arch=('x86_64')
url="https://github.com/fonttools/$_pkgname"
license=('BSD')
depends=('python')
makedepends=('cython' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cython')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('53bdc24c3a1d8d6bef1838dbc16d3004fca819c770f4ea06b7a520ccff7f4f60')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
    python setup.py build_ext --inplace
}

check() {
    cd "$_pkgname-$pkgver"
    PYTHONPATH="src/python" pytest
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
