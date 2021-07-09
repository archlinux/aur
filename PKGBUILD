# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-termplotlib
_name=termplotlib
pkgver=0.3.8
pkgrel=1
pkgdesc="Plotting on the command line"
arch=('any')
url="https://github.com/nschloe/termplotlib"
license=('GPL')
depends=('python' 'python-numpy' 'gnuplot')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('f3276ac23b550ad3ad22bb1d7001828f32bec779dab39666c960e7f0fd704de8f9fd96902dc75c5d32e86c53dc391db21cff259d541aa9821bcf8293729a1d27')

build() {
	cd "$srcdir/$_name-$pkgver"
	export PYTHONHASHSEED=0
	python -c "from setuptools import setup; setup()" build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup();" install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
