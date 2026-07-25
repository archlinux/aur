# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='std-uritemplate'
pkgname="python-$_projectname"
pkgver='2.0.12'
pkgrel='1'
pkgdesc='A complete and maintained Python implementation of the Uri Template specification RFC 6570 Level 4'
arch=('any')
url="https://github.com/$_projectname/$_projectname"
license=('Apache-2.0')
depends=('python>=3.8.0')
makedepends=('git' 'python-build' 'python-poetry' 'python-installer' 'python-wheel')
source=("$pkgname::git+$url#tag=$pkgver?signed")
b2sums=('d02933d85674b709266cc2bfe442a6fc4c9e9e925cd9ed19a4ad49bae60bd2c56969dfa95469f38cc33ca16402bef445973272f7ada8d8b97b180c1bacf23a44')

_sourcedirectory="$pkgname/python"

build() {
	cd "$srcdir/$_sourcedirectory/"
	cp '../Readme.md' 'Readme.md'
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 'Readme.md' "$pkgdir/usr/share/doc/$pkgname/Readme.md"
}
