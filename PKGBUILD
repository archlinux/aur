# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=blacktex
pkgver=0.5.2
pkgrel=2
pkgdesc="LaTex code prettifier and formatter"
arch=('any')
url="https://github.com/nschloe/blacktex"
license=('GPL3')
depends=('python>=3.6')
optdepends=('python-importlib-metadata: required for python<3.8')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pytest-randomly')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'setup.py')
sha256sums=('5712be99418d300f9cc6696ed3a3f6a8b871994ebbe44289e4497ad7fde51f00'
            '843ac26c38a41abae578250bc0f9419194b320a0f67327d941037a4268f6cfe7')

prepare() {
	cp setup.py "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python setup.py pytest
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
