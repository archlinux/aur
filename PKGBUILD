plainname=pyjnius
pkgname="python2-$plainname"
pkgver=1.0.3
pkgrel=1
pkgdesc='Python module to access Java class as Python class, using JNI.'
arch=('i686' 'x86_64')
url="https://github.com/kivy/$plainname"
license=('LGPL3')
depends=('java-environment' 'python2')
makedepends=('cython2')
source=("$plainname-$pkgver.tar.gz::https://github.com/kivy/$plainname/tarball/$pkgver")
noextract=("$plainname-$pkgver.tar.gz")
md5sums=('dd65160abb28e0aa9e405b18a95efc55')

build() {
	cd "$srcdir"
	if [[ ! -d "$plainname-$pkgver" ]]; then
		mkdir "$plainname-$pkgver"
		tar -xf "$plainname-$pkgver.tar.gz" --strip-components=1 -C "$plainname-$pkgver"
	fi
	cd "$plainname-$pkgver"
	
	python2 setup.py build_ext --inplace -f
	python2 setup.py build
}

package() {
	cd "$srcdir/$plainname-$pkgver"
	python2 setup.py install --prefix="$pkgdir/usr"
}