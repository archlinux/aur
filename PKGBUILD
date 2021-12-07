# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>

pkgname=python-pyreadstat
pkgver=1.1.4
pkgrel=1
pkgdesc="Reads sas, spss and stata files into Pandas data frames."
license=('Apache' 'MIT')
arch=('i686' 'x86_64')
url="https://github.com/Roche/pyreadstat"
depends=('python-pandas')
makedepends=('python-setuptools' 'cython')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('04d776d195c1f7a9a9b2d2933699e9969ef9791d616191415d0c02a5877a1d83')

build() {
	cd "pyreadstat-$pkgver"
	python setup.py build
}

check() {
	cd "pyreadstat-$pkgver"
	local _ver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_ver" python tests/test_basic.py
}

package() {
	export PYTHONHASHSEED=0
	cd "pyreadstat-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
