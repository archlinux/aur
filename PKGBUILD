# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-inventree
_name=${pkgname#python-}
pkgver=0.19.0
pkgrel=1
pkgdesc="Python interface for InvenTree inventory management system"
url="https://github.com/inventree/inventree-python/"
depends=(
    'python'
    'python-requests'
)
makedepends=(python-build python-installer python-wheel python-setuptools twine)
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6409bc51fb05a8d491a5cc030f486c4040c82cefbc21ffbd5231fcf8cd34b404')

build() {
	cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    cd $pkgdir/usr/lib/python3*/site-packages/
    rm -rf scripts test
}
