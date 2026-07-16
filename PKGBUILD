# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
_projectname='msgraph-sdk-python-core'
pkgname='python-msgraph-core'
pkgver='1.5.1'
pkgrel='1'
epoch='1'
pkgdesc='Core component of the Microsoft Graph Python SDK consisting of HTTP/Graph Client and a configurable middleware pipeline'
arch=('any')
url="https://github.com/microsoftgraph/$_projectname"
license=('MIT')
depends=('python>=3.10.0' 'python-h2' 'python-httpx>=0.23.0' 'python-microsoft-kiota-abstractions>=1.11.6' 'python-microsoft-kiota-authentication-azure>=1.11.6' 'python-microsoft-kiota-http>=1.11.6')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-azure-identity' 'python-deprecated' 'python-dotenv' 'python-microsoft-kiota-serialization-json>=1.11.6' 'python-pytest' 'python-pytest-asyncio')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('5239b58af4b280055fb1461e5d4ec9cdfa9087d7a960f2d3341ec3e255a445ffd62c705dc66b9a94a68fc37f997a6e93f133f8d354b3d4ee4866e738babe839f')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	pytest
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
