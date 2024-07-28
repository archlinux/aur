# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='salvador'
pkgver='3.1.0'
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
b2sums=('3e8ba31a3a6dacb625c8438eee5dc48ebde081d36e71eea0ea5199eea21ef0327c94bc3f4fc7585a8a96c0b569ea58667d5878d33726b5023c5cba20fedb48de')

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
