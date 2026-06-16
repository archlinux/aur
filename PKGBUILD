# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
_projectname='azure-core'
pkgname="python-$_projectname"
pkgver='1.41.0'
pkgrel='1'
pkgdesc='Microsoft Azure Core Shared Client Library for Python'
arch=('any')
url='https://github.com/Azure/azure-sdk-for-python'
license=('MIT')
depends=('python>=3.10.0' 'python-requests>=2.21.0' 'python-typing_extensions>=4.6.0')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
optdepends=(
	'python-aiohttp: aiohttp transport'
	'python-opentelemetry-api: OpenTelemetry tracing support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${_projectname}_$pkgver.tar.gz")
b2sums=('962a42ab5fdeab204f8fa34a3089a5658d76c190beb897524259d3d6338256ce61d7b458aa7422ec3b96c02ec9c6b74d2f4737e5befc20e8445263fbd676dffc')

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
