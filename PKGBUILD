# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=idris2-filepath
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=1
epoch=
pkgdesc='Unix style file paths in Idris2'
arch=('x86_64')
url='https://github.com/stefan-hoeck/idris2-filepath'
license=('custom:BSD')
depends=('idris2')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

_setenv() {
	unset IDRIS2_PACKAGE_PATH IDRIS2_PREFIX
	IDRIS2_PACKAGE_PATH="$(idris2 --libdir)"
	IDRIS2_PREFIX="$pkgdir/usr/lib"
	export IDRIS2_PACKAGE_PATH IDRIS2_PREFIX
}

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	_setenv
	cd "$srcdir/$_pkgname"
	idris2 --build
}

package() {
	_setenv
	cd "$srcdir/$_pkgname"

	idris2 --install-with-src
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
