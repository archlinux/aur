# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
_projectname='azure-identity'
pkgname="python-$_projectname"
pkgver='1.25.1'
pkgrel='1'
pkgdesc='Microsoft Azure Identity Client Library for Python'
arch=('any')
url='https://github.com/Azure/azure-sdk-for-python'
license=('MIT')
depends=('python>=3.9.0' 'python-azure-core>=1.31.0' 'python-cryptography>=2.5.0' 'python-msal>=1.30.0' 'python-msal-extensions>=1.2.0' 'python-typing_extensions>=4.0.0')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${_projectname}_$pkgver.tar.gz")
b2sums=('e09dd3f2340ac38b7ceb1505e779faf8dc4909863ced1e845cd6d21fcda0dd3a5d6224fa89da24a64068f380f86d40159784bde69798837b82922c5b760402fb')

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
