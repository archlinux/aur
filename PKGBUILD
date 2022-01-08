# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-quicktions
pkgver=1.12
pkgrel=1
pkgdesc="Fast fractions implementation in Cython"
arch=('x86_64')
url="https://github.com/scoder/quicktions"
license=('Python')
depends=('glibc')
makedepends=('python-setuptools' 'cython')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('691463020f41386e10dc05da1eef4090270443557dbdf94a5ceabed389951cfa')

build() {
	cd "quicktions-$pkgver"
	make
}

check() {
	cd "quicktions-$pkgver"
	local _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_python_version" make test
}

package() {
	export PYTHONHASHSEED=0
	cd "quicktions-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
