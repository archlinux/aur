# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='pysmart'
_reponame='py-SMART'
pkgname="python-$_projectname"
pkgver='1.1.0'
pkgrel='1'
epoch='1'
pkgdesc='Wrapper for smartctl (smartmontools) - FreeNAS fork'
arch=('any')
url="https://github.com/freenas/$_reponame"
license=('LGPL2.1')
depends=('python' 'python-humanfriendly' 'smartmontools')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('8540d428045345a136ff492f4c423446eda5e8d23d254532c08edbc3fe851a494e3a9b10054bb4f1c6dd2ff312d746f83f604453e8d9fec37bc48a59b122c298')

_sourcedirectory="$_reponame-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	pytest
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
