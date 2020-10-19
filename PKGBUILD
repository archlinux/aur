# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=pandoc-include
pkgname=python-$_pipname
pkgver=0.8.3
pkgrel=1
pkgdesc="Panflute filter to allow file includes"
arch=(any)
url="https://github.com/DCsunset/$_pipname"
license=('MIT')
_py_deps=('click' 'future' 'panflute' 'shutilwhich' 'yaml')
depends=("${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DCsunset/$_pipname/archive/v$pkgver.tar.gz")
sha256sums=('6cd679f5d221d0c1b974b9780f0c044fe1959afc39d73b003df20c32bf217720')

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
