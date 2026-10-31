# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='std-uritemplate'
pkgname="python-$_projectname"
pkgver='2.0.13'
pkgrel='1'
pkgdesc='A complete and maintained Python implementation of the Uri Template specification RFC 6570 Level 4'
arch=('any')
url="https://github.com/$_projectname/$_projectname"
license=('Apache-2.0')
depends=('python>=3.8.0')
makedepends=('git' 'python-build' 'python-poetry' 'python-installer' 'python-wheel')
source=("$pkgname::git+$url#tag=$pkgver?signed")
b2sums=('b1e5ab0353919b55a67e69eb7608bacc26bb131f33fd755579b0c0993ef7e66d4af21ded16bd213b82bfbee92e58b7022b1f80576eef4464bc42015464cc7781')

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
