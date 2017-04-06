_name=pyjnius
pkgname=python2-pyjnius
pkgver=1.1.1
pkgrel=1
pkgdesc='Python module to access Java class as Python class, using JNI.'
arch=(any)
url="https://github.com/kivy/$_name"
license=(LGPL3)
depends=(java-environment python2)
makedepends=(cython2)
source=("$_name-$pkgver.tar.gz::https://github.com/kivy/$_name/tarball/$pkgver")
md5sums=(2d457e4761b27e6760cf54efb6201f17)

build() {
	cd "kivy-$_name-"*
	
	python2 setup.py build_ext --inplace -f
	python2 setup.py build
}

package() {
	export PYTHONPATH="$pkgdir/usr/lib/python2.7/site-packages"
	mkdir -p "$PYTHONPATH"
	
	cd "$srcdir/kivy-$_name-"*
	python2 setup.py install --prefix="$pkgdir/usr" --optimize=1
}
