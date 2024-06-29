# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='salvador'
pkgver='2.4.2'
pkgrel='1'
pkgdesc='A bash script that will help you maintain your AUR packages'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL-3.0-or-later')
depends=('git' 'pacman-contrib' 'perl')
optdepends=(
	'curl: nvchecker functionality'
	'jq: nvchecker functionality'
	'nvchecker: nvchecker functionality'
)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a9bf832d13dcd753896fb0cd15fccfaff341b108130e7b346aa309811b0a258be796e302e72f481936c535f64d5c58fafb5244c38256d9c8cdc566ca2cdd933d')

_sourcedirectory="$pkgname-$pkgver"

check() {
	"$srcdir/$_sourcedirectory/$pkgname.sh" version | tee '/dev/stderr' | grep -q "^$pkgver$"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
