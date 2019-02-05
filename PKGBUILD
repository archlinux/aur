# Maintainer: Colin Unger <mastakata 3 at yahoo dot com>

pkgname=python-z3-solver-angr
pkgdesc="A high-performance theorem prover from Microsoft Research, for use with the angr binary analysis platform"
url="https://github.com/Z3Prover/z3"
pkgver=4.5.1.0.post2
pkgrel=1
arch=('any')
depends=('python')
makedepends=('make' 'gcc7' 'python-setuptools')
provides=('python-z3')
conflicts=('python-z3')
license=('MIT')
_pypiname=z3-solver
source=("$pkgname::https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$_pypiname-$pkgver"
	sed -i 's/gcc/gcc-7/g' "$srcdir/$_pypiname-$pkgver/core/scripts/mk_util.py"
	sed -i 's/g++/g++-7/g' "$srcdir/$_pypiname-$pkgver/core/scripts/mk_util.py"
}

build() {
	cd "$srcdir/$_pypiname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pypiname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 core/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
