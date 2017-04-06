_name=pyjnius
pkgname=python-pyjnius
pkgver=1.1.1
pkgrel=1
pkgdesc='Python module to access Java class as Python class, using JNI.'
arch=(any)
url="https://github.com/kivy/$_name"
license=(LGPL3)
depends=(java-environment python)
makedepends=(cython)
source=("$_name-$pkgver.tar.gz::https://github.com/kivy/$_name/tarball/$pkgver")
md5sums=(2d457e4761b27e6760cf54efb6201f17)

build() {
	cd "kivy-$_name-"*
	
	python setup.py build_ext --inplace -f
	python setup.py build
}

package() {
	export PYTHONPATH="$pkgdir/usr/lib/$(readlink /usr/bin/python3)/site-packages"
	mkdir -p "$PYTHONPATH"
	
	cd "$srcdir/kivy-$_name-"*
	python setup.py install --prefix="$pkgdir/usr" --optimize=1
}
