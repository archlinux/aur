
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=jupyter-gnuplot_kernel
_pkgname=${pkgname#*-}
pkgver=0.4.1
pkgrel=3
pkgdesc='A Jupyter kernel for GNUplot'
arch=('any')
url="https://github.com/has2k1/$_pkgname"
license=('BSD')
depends=('jupyter-metakernel' 'jupyter-notebook' 'gnuplot')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
install=${pkgname}.install
source=("$_pkgname-$pkgver::$url/archive/v$pkgver.tar.gz")
sha256sums=('bfc0e72556a32198b589ccfa97ed9575e31e2017f3f60b65a1b6d956bd1a7333')

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	python setup.py build
}

check() {
	cd "$srcdir/$_pkgname-$pkgver"

	pytest
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.rst' -t "$pkgdir/usr/share/doc/$pkgname"
}
