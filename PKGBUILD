# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-termplotlib
_name=termplotlib
pkgver=0.3.7
pkgrel=1
pkgdesc="Plotting on the command line"
arch=('any')
url="https://github.com/nschloe/termplotlib"
license=('GPL')
depends=('python' 'python-numpy' 'gnuplot')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('409b2c0eabb3a476fdf0e3641722a6786daabc7f7270fcf7703e5b7c62ce5230d8591ca348e49d5accaee74ff388042a79b52155cf7710a8c5b29e01a7247456')

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
