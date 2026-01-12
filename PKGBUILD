# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
_projectname='azure-core'
pkgname="python-$_projectname"
pkgver='1.38.0'
pkgrel='1'
pkgdesc='Microsoft Azure Core Shared Client Library for Python'
arch=('any')
url='https://github.com/Azure/azure-sdk-for-python'
license=('MIT')
depends=('python>=3.9.0' 'python-aiohttp>=3.0.0' 'python-requests>=2.21.0' 'python-typing_extensions>=4.6.0')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${_projectname}_$pkgver.tar.gz")
b2sums=('4945bfe946ef1417bc42e941454d6f12c7fa05f6b817ffe3fe57292313766d394c510e2186cd9aeb4f57aa12ea880f0e200b19d2459958cf88284bd21a21a1de')

_sourcedirectory="azure-sdk-for-python-${_projectname}_$pkgver/sdk/core/$_projectname"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

# Tests ignored, as the devtools_testutils package is not supposed to be released/published (see https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=261305)

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
