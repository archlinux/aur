# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='salvador'
pkgver='3.1.2'
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
b2sums=('2226b5917d25f882d89080aa1a21ace103ed01114ccda8dd74ab4b2e5ef129fdc36ba2d91649b41d24163cd3be2345bcce8a210f7fb9b35bc77c2dd72741580d')

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
