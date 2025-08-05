# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='salvador'
pkgver='3.3.1'
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
b2sums=('0e89b82110394740d2680c90e33e52ef4dba73ac46215fdd07444cd8de30eb92bacde9d149d59e7ff9d9e661c2ec2b0b6e6c59fe6504f18786c1e9c4c2f55c71')

_sourcedirectory="$pkgname-$pkgver"

check() {
	_checkoutput="$("$srcdir/$_sourcedirectory/$pkgname.sh" version)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "^$pkgver$"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
