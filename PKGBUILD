# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=pandoc-include
pkgname=python-$_pipname
pkgver=0.8.4
pkgrel=1
pkgdesc="Panflute filter to allow file includes"
arch=(any)
url="https://github.com/DCsunset/$_pipname"
license=('MIT')
_py_deps=('natsort>=7' 'panflute>=2.0.5')
depends=("${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DCsunset/$_pipname/archive/v$pkgver.tar.gz")
sha256sums=('80f6a3a80504cd2aa256f5c0e7e778d35006d4d1875e4f17cb19edfaf58d0733')

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
