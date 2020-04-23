# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>
# Contributor: Lara Maia <lara@craft.net.br>
# Contributor: archlinux.info:tdy
_pkgname='weatherspect'
pkgname="$_pkgname-git"
pkgver='2.0.r3.g0f85875'
pkgrel='1'
pkgdesc='A virtual weather environment in ASCII - git version'
arch=('any')
url="https://github.com/AnotherFoxGuy/$_pkgname"
license=('GPL2')
depends=('perl' 'perl-term-animation')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname::git+$url"
	"$_pkgname.1"
)
sha256sums=('SKIP'
            '8b0d7bb995e44190cc005ec3b604f147dcb233744a262cbbf9a9ad8f9214ab0c')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

package() {
	cd "$srcdir/"
	install -Dm755 "$_sourcedirectory/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
