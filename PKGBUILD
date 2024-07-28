# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='salvador'
pkgver='3.0.1'
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
b2sums=('78a18f528c31b9d47eb28ce1ec4d9c85ba6e4208bf9d7f026dc808a03263deef9ff0b78becc837d22f7a5aa1c4e8b54e6685f07096ded1c841fab74aefcd4118')

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
