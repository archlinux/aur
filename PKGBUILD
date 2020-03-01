# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=pandoc-include
pkgname=python-$_pipname
pkgver=0.7.0
pkgrel=1
pkgdesc="Panflute filter to allow file includes"
arch=(any)
url="https://github.com/DCsunset/$_pipname"
license=('MIT')
_py_deps=('click' 'future' 'panflute' 'shutilwhich' 'yaml')
depends=("${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DCsunset/$_pipname/archive/v$pkgver.tar.gz")
sha256sums=('31de2c32dc7df8096f75c7e73f9bbf9b70c7f1d468b37db07735bf0518c6b3dc')

build() {
	cd "$_pipname-$pkgver"
	python setup.py build
}

check() {
    cd "$_pipname-$pkgver"
	python setup.py test
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" LICENSE
}
