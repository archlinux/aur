# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=pandoc-include
pkgname=python-$_pipname
pkgver=0.8.5
pkgrel=1
pkgdesc="Panflute filter to allow file includes"
arch=(any)
url="https://github.com/DCsunset/$_pipname"
license=('MIT')
_py_deps=('natsort>=7' 'panflute>=2.0.5')
depends=("${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DCsunset/$_pipname/archive/v$pkgver.tar.gz")
sha256sums=('c6b7850704cc80d792e95576397a71ee8bcc7350c9599dc8f10077835db83c8a')

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
