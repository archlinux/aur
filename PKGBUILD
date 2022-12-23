# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='pysmart'
_reponame='py-SMART'
pkgname="python-$_projectname"
pkgver='1.2.2'
pkgrel='1'
epoch='1'
pkgdesc='Wrapper for smartctl (smartmontools) - FreeNAS fork'
arch=('any')
url="https://github.com/freenas/$_reponame"
license=('LGPL2.1')
depends=('python>=3.7.0' 'python-humanfriendly' 'smartmontools')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('59679a493714b25e96be213ac43f0f49659a473669b131098d3c5e2f4b8bf52aacef39c3162489ca4baf609098717c2d8d165e7fd5a7e494474f99fd8ba3fac0')

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
