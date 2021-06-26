# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>

pkgname=python-dmsh
_name=dmsh
pkgver=0.2.17
pkgrel=1
pkgdesc="Simple mesh generator inspired by distmesh."
arch=('x86_64')
url="https://github.com/nschloe/dmsh"
license=('GPL')
optdepends=('python-matplotlib')
makedepends=('python'
	'python-setuptools')
depends=('python-meshplex' 'python-numpy' 'python-scipy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('36fd09ebe1f3d852c83a47ca9d03a563877029f8a137d9b6620550a6888ec6c6f1a0ac81ce8797f82bfaa37904f3c93dab8e40b1faae72d1613759904b5e6db4')

build() {
	cd "$srcdir/$_name-$pkgver"
	export PYTHONHASHSEED=0
	python -c "from setuptools import setup; setup()" build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup();" install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
