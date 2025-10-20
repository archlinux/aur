# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
_projectname='azure-core'
pkgname="python-$_projectname"
pkgver='1.36.0'
pkgrel='1'
pkgdesc='Microsoft Azure Core Shared Client Library for Python'
arch=('any')
url='https://github.com/Azure/azure-sdk-for-python'
license=('MIT')
depends=('python>=3.9.0' 'python-aiohttp>=3.0.0' 'python-requests>=2.21.0' 'python-typing_extensions>=4.6.0')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${_projectname}_$pkgver.tar.gz")
b2sums=('f9b6a049b91892591102ec2441f80e1a45e6c5bdea48dbca6b4602bf681e26e1e34098f8ecbfb451e21171342c60a0db48d6960a5fb7b59db620c05ebe0ae442')

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
