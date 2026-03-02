# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
_projectname='azure-identity'
pkgname="python-$_projectname"
pkgver='1.25.2'
pkgrel='1'
pkgdesc='Microsoft Azure Identity Client Library for Python'
arch=('any')
url='https://github.com/Azure/azure-sdk-for-python'
license=('MIT')
depends=('python>=3.9.0' 'python-azure-core>=1.31.0' 'python-cryptography>=2.5.0' 'python-msal>=1.31.0' 'python-msal-extensions>=1.2.0' 'python-typing_extensions>=4.0.0')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${_projectname}_$pkgver.tar.gz")
b2sums=('fe3ba3370ac85ef724d119b4c175bd8d1d2c557adee6f815f2f81377308635268c51714b210afa46cfc2f497d4f0bd69a9ad73a4645b2eb7ceb0d5df7b7cfdaf')

_sourcedirectory="azure-sdk-for-python-${_projectname}_$pkgver/sdk/identity/$_projectname"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

# Tests ignored, as the devtools_testutils package is not supposed to be released/published (see https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=261305)

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
