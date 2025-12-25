# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thomas Heinemann <thomas@nipha.de>
# Contributor: Jean Lucas < jean at 4ray dot co>
_projectname='mailsuite'
pkgname="python-$_projectname"
pkgver='1.11.0'
_commit='8fbff9ea554b1f9d348e1ce6e9efd9188f4c7db7'
pkgrel='1'
pkgdesc='A Python package to make receiving, parsing, and sending email easier'
arch=('any')
url="https://github.com/seanthegeek/$_projectname"
license=('Apache-2.0')
depends=('python>=3.9.0' 'python<3.14.0' 'python-dnspython>=2.0.0' 'python-expiringdict>=1.2.2' 'python-html2text>=2020.1.16' 'python-imapclient>=2.1.0' 'mailparser>=4.1.2' 'python-publicsuffix2>=2.20190812')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
b2sums=('45d1c55e6a292bc8919204a0455e91907aaf75ae1e33989c1c3132e829383e95b7333f164d55195caf5e5cada8f05db1b0bb77fe40bcedb8ebeac6410d0097f9')

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
