# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thomas Heinemann <thomas@nipha.de>
# Contributor: Jean Lucas < jean at 4ray dot co>
_projectname='mailsuite'
pkgname="python-$_projectname"
pkgver='1.11.1'
_commit='c898a8b3e3ec580b3626345e509b7228bb95de84'
pkgrel='1'
pkgdesc='A Python package to make receiving, parsing, and sending email easier'
arch=('any')
url="https://github.com/seanthegeek/$_projectname"
license=('Apache-2.0')
depends=('python>=3.9.0' 'python<3.14.0' 'python-dnspython>=2.0.0' 'python-expiringdict>=1.2.2' 'python-html2text>=2020.1.16' 'python-imapclient>=2.1.0' 'mailparser>=4.1.2' 'python-publicsuffix2>=2.20190812')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
b2sums=('15d61977fb0f0e32779a9687be533019d4e02a51272f911124382c6e41008cc0765c0cd046750967e26772d317c2ad7e7321d9c2e16a7b5a907ae3097b96706e')

_sourcedirectory="$_projectname-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
}
