# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>
# Contributor: Lara Maia <lara@craft.net.br>
# Contributor: archlinux.info:tdy
_pkgname='weatherspect'
pkgname="$_pkgname-git"
pkgver='2.0.r3.g0f85875'
pkgrel='2'
pkgdesc='A virtual weather environment in ASCII - git version'
arch=('any')
url="https://github.com/AnotherFoxGuy/$_pkgname"
license=('GPL2')
depends=('perl' 'perl-compass-points' 'perl-json' 'perl-term-animation')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname::git+$url"
	'devendor.diff'
	"$_pkgname.1"
)
sha512sums=('SKIP'
            'adaadc88a212143a1d232756dda48580d612ce93024dd467608571344963dc6f9aa4fe0d2730f55f451946a47d31ac83fb9def18e10e33192b1b656db698b673'
            '494dcc31151912ae6965a6c7f6323f1c3fbfa01f1eadc72838e605917ab6a4df4aba95aab2a891070eb928817b35240eecfa3d6a4fc285ff8a4e729044968caa')

_sourcedirectory="$pkgname"


prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Devendor perl-compass-points and perl-json
	patch --forward -p1 < '../devendor.diff'
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

package() {
	cd "$srcdir/"
	install -Dm755 "$_sourcedirectory/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
