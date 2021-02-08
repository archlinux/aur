# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

_project=ots-python
_pyname=opentype-sanitizer
pkgname=python-$_pyname
pkgver=8.1.3
pkgrel=1
pkgdesc='Python wheels for the OpenType Sanitizer'
arch=('any')
url="https://github.com/googlefonts/$_project"
license=('GPL3')
depends=('python' 'ots')
checkdepends=('python-pytest')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz"
        system-ots-sanitize.patch)
sha256sums=('a0d1c221307ff8de7f74613b5836a3d50f1a19e98bacb8b5904df47b0354e68c'
            '6388d57e44f3dc7d6ee91422b30ca9eca3e3c590bacaa7bc4664b6183ed4d065')

prepare () {
    cd "$_pyname-$pkgver"
    patch -p0 < "$srcdir/system-ots-sanitize.patch"
}

build() {
    cd "$_pyname-$pkgver"
    python setup.py build
}

check() {
    cd "$_pyname-$pkgver"
    PYTHONPATH=src/python pytest
}

package() {
    cd "$_pyname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
