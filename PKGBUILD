# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: vanyasem

pkgname=python-allpairspy
pkgver=2.5.0
pkgrel=2
pkgdesc='Python library for test combinations generator'
arch=('any')
license=('MIT')
url='https://github.com/thombashi/allpairspy'
changelog=CHANGES.txt
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4af06f6af70d53f126daf04fda82ae1dbb8517b0bdad0f55aaa5e04f3d9daa6a')

build() {
	cd "allpairspy-$pkgver"
	python setup.py build
}

check() {
	cd "allpairspy-$pkgver"
	python setup.py pytest
}

package() {
	cd "allpairspy-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
