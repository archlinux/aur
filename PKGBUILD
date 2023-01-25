# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='pysmart'
_reponame='py-SMART'
pkgname="python-$_projectname"
pkgver='1.2.3'
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
sha512sums=('4f0ce9e3f609b940897f6ca80b69ad0af5a62cf3f27d80ff6595073b27c299ff9bc6eaedfca0fef02870c071535490ed72d5bb4ed34386970221fc8d887a93c0')

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
