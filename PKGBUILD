# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thomas Heinemann <thomas@nipha.de>
# Contributor: Jean Lucas < jean at 4ray dot co>
_projectname='mailsuite'
pkgname="python-$_projectname"
pkgver='1.9.20'
_commit='3769c8c6bb9ca41e1e1a5c8529445bdb559d53cc'
pkgrel='1'
pkgdesc='A Python package to make receiving, parsing, and sending email easier'
arch=('any')
url="https://github.com/seanthegeek/$_projectname"
license=('Apache-2.0')
depends=('python>=3.7.0' 'python-dnspython>=2.0.0' 'python-expiringdict>=1.2.2' 'python-html2text>=2020.1.16' 'python-imapclient>=2.1.0' 'mailparser>=4.1.2' 'python-publicsuffix2>=2.20190812')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
b2sums=('b4116128285962b467bbeba89b6a56edcb82adc4a3156d36c53e580054bed9f4412b071c28652604aa3371f54d8577a560db4085efe645f546fabe79ae42fedf')

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
