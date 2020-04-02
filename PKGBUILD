# Maintainer: Benjamin Abadie <benjamin.abadie enix fr>

pkgname=python-pyeapi
_pkgname=pyeapi
pkgver=0.8.3
pkgrel=4
pkgdesc="Python client for Arista eAPI "
arch=('any')
url="https://pyeapi.readthedocs.io/"
license=('BSD')
depends=('python-netaddr')
makedepends=('git' 'python-setuptools' )
checkdepends=('python-pytest' 'python-mock' 'python-coverage')
source=("git+https://github.com/arista-eosplus/pyeapi.git#tag=v$pkgver")
md5sums=('SKIP')

check() {
    cd "$srcdir/$_pkgname/"
    coverage run -m unittest discover test/unit -v
}

build() {
	cd "$srcdir/$_pkgname/"
    python setup.py build
}

package() {
	cd "$srcdir/$_pkgname/"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    mkdir -p "$pkgdir/usr/share/licenses/$_pkgname/"
    cp LICENSE "$pkgdir/usr/share/licenses/$_pkgname/"
}
