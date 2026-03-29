# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
_projectname='azure-core'
pkgname="python-$_projectname"
pkgver='1.39.0'
pkgrel='1'
pkgdesc='Microsoft Azure Core Shared Client Library for Python'
arch=('any')
url='https://github.com/Azure/azure-sdk-for-python'
license=('MIT')
depends=('python>=3.9.0' 'python-requests>=2.21.0' 'python-typing_extensions>=4.6.0')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
optdepends=(
	'python-aiohttp: aiohttp transport'
	'python-opentelemetry-api: OpenTelemetry tracing support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${_projectname}_$pkgver.tar.gz")
b2sums=('ad997caa6f5996858d0cfbb2eff46dc4a419c9f4e023e12d69bc8d23deb4342d3fe5eddd2046fd19cd9f112bce0beef08468fc4e5a9f99523d74170641965252')

_sourcedirectory="azure-sdk-for-python-${_projectname}_$pkgver/sdk/core/$_projectname"

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
