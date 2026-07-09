# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thomas Heinemann <thomas@nipha.de>
# Contributor: Jean Lucas < jean at 4ray dot co>
_projectname='mailsuite'
pkgname="python-$_projectname"
pkgver='2.2.2'
pkgrel='1'
pkgdesc='A Python package to make receiving, parsing, and sending email easier'
arch=('any')
url="https://github.com/seanthegeek/$_projectname"
license=('Apache-2.0')
depends=(
	'python>=3.9.0' 'python-authres>=1.2.0' 'python-azure-identity>=1.15.0' 'python-cryptography>=41.0.0' 'python-dkim>=1.1.0'
	'python-dnspython>=2.0.0' 'python-expiringdict>=1.2.2' 'python-google-api-python-client>=2.0.0' 'python-google-auth>=2.0.0'
	'python-google-auth-oauthlib>=1.0.0' 'python-html2text>=2020.1.16' 'python-imapclient>=3.1.0' 'python-msgraph-sdk>=1.0.0'
	'python-publicsuffix2>=2.20190812' 'mailparser>=4.2.1'
)
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('8819ce657a029fc3fc94dd83cd2408d1d08732da6d0c3013a7d6ca0d316553a60429f2eee1293903ed270e3dc3683a0ea35eed37b272ced11f81fe2fa0a957e2')

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
}
