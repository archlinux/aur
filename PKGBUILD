_name=pyjnius
pkgname=python-$_name
pkgver=1.4.1
pkgrel=1
pkgdesc='Python module to access Java class as Python class, using JNI.'
arch=(any)
url="https://github.com/kivy/$_name"
license=(MIT)
depends=(python java-environment python-six)
makedepends=(cython python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8bc1a1b06fb11df8dd8b8d56f5ecceab614d4ba70cf559c64ae2f146423d53ce')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build_ext --inplace -f
	python setup.py build
}


check() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py test
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
