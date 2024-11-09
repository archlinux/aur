pkgname=python-gmplot-git
pkgver=1.4.1
pkgrel=1
pkgdesc="A matplotlib-like interface to plot data with Google Maps"
arch=('any')
url="https://github.com/gmplot/gmplot"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('python-gmplot')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
	git -C "${srcdir}/gmplot" clean -dfx
}

build() {
	cd gmplot
	python setup.py build
}

package() {
	cd gmplot
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
}

