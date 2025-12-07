# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thomas Heinemann <thomas@nipha.de>
# Contributor: Jean Lucas < jean at 4ray dot co>
_projectname='mailsuite'
pkgname="python-$_projectname"
pkgver='1.10.1'
_commit='339bea223835248042ad7708b22c2662dd9f4d3a'
pkgrel='1'
pkgdesc='A Python package to make receiving, parsing, and sending email easier'
arch=('any')
url="https://github.com/seanthegeek/$_projectname"
license=('Apache-2.0')
depends=('python>=3.9.0' 'python<3.14.0' 'python-dnspython>=2.0.0' 'python-expiringdict>=1.2.2' 'python-html2text>=2020.1.16' 'python-imapclient>=2.1.0' 'mailparser>=4.1.2' 'python-publicsuffix2>=2.20190812')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
b2sums=('a7fe3afa2126d5911401026ed3c3f9dad9d5026ad0df12b8d175a3a27a1016eaa5ed5f0f99c6e26a988cc4111ec0ab445280da3c15a6f34520b4844a6a39b1ac')

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
