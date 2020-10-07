# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-skia-pathops
_pkgname=${pkgname#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc='Python bindings for the Skia library’s Path Ops'
arch=('x86_64')
url="https://github.com/fonttools/$_pkgname"
license=('BSD')
depends=('python')
makedepends=('cython' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cython')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('3ddd7ffa6eec59694c2deb63a2cd91a52b0799c625c55be8277d2039fe3fde25')

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
