# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
_projectname='msgraph-sdk-python-core'
pkgname='python-msgraph-core'
pkgver='1.5.0'
pkgrel='1'
epoch='1'
pkgdesc='Core component of the Microsoft Graph Python SDK consisting of HTTP/Graph Client and a configurable middleware pipeline'
arch=('any')
url="https://github.com/microsoftgraph/$_projectname"
license=('MIT')
depends=('python>=3.10.0' 'python-h2' 'python-httpx>=0.23.0' 'python-microsoft-kiota-abstractions>=1.11.6' 'python-microsoft-kiota-authentication-azure>=1.11.6' 'python-microsoft-kiota-http>=1.11.6')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-azure-identity' 'python-deprecated' 'python-dotenv' 'python-pytest' 'python-pytest-asyncio')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('a09718f71f4e6887669c0302f9c64d6d94cd90600f9b351909e3204f211680197973dec0ba688efbba9dab81f0edf3c6f521a8122b6d62e74daab50eee183e12')

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
