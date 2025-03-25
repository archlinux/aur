# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thomas Heinemann <thomas@nipha.de>
# Contributor: Jean Lucas < jean at 4ray dot co>
_projectname='mailsuite'
pkgname="python-$_projectname"
pkgver='1.10.0'
_commit='a0af3387a48a22b5f40c7aadc6dc14f3f2a587d0'
pkgrel='1'
pkgdesc='A Python package to make receiving, parsing, and sending email easier'
arch=('any')
url="https://github.com/seanthegeek/$_projectname"
license=('Apache-2.0')
depends=('python>=3.7.0' 'python-dnspython>=2.0.0' 'python-expiringdict>=1.2.2' 'python-html2text>=2020.1.16' 'python-imapclient>=2.1.0' 'mailparser>=4.1.2' 'python-publicsuffix2>=2.20190812')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
b2sums=('71c79437b939b865bbfdb4d6c8f61913ba1c9cb209721618a8c8163f8f26e193026767619162a520167907ef3ca1f92ea5542d39758ffb7b038b5be45ee2c2f3')

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
