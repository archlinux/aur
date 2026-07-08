# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='std-uritemplate'
pkgname="python-$_projectname"
pkgver='2.0.11'
pkgrel='1'
pkgdesc='A complete and maintained Python implementation of the Uri Template specification RFC 6570 Level 4'
arch=('any')
url="https://github.com/$_projectname/$_projectname"
license=('Apache-2.0')
depends=('python>=3.8.0')
makedepends=('git' 'python-build' 'python-poetry' 'python-installer' 'python-wheel')
source=("$pkgname::git+$url#tag=$pkgver?signed")
b2sums=('6f9afa61dbc54a1d0f563f1c7d018a44a95e6ce3a6ceed4919e3873c82acc2f0363044dad615d6d22f6b5fce6379fcff288a3a46455440a9975f981d99e0090f')
validpgpkeys=('6BE4A32F948F8FE9F91A49EFCA87FC208F4CB4C8') # Vincent Biret <vincentbiret@hotmail.com> (https://github.com/baywet.gpg)

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
