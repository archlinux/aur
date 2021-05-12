# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=pandoc-include
pkgname=python-$_pipname
pkgver=0.8.7
pkgrel=1
pkgdesc="Panflute filter to allow file includes"
arch=(any)
url="https://github.com/DCsunset/$_pipname"
license=('MIT')
_py_deps=('natsort>=7' 'panflute>=2.0.5')
depends=("${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DCsunset/$_pipname/archive/v$pkgver.tar.gz")
sha256sums=('af4a8d950713896d5f6bf4f43d51b978a8f4bef842bdd10974f4760e78db8262')

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
