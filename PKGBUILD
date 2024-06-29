# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='salvador'
pkgver='2.4.3'
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
sha512sums=('425a2f00a20313f94cf05a0adba855752cb399360c435c17843273210e854bd2ae59db0832b303ba41925ae2989ecd393d91a2eaba6a88e207e722959eb2cc65')

_sourcedirectory="$pkgname-$pkgver"

check() {
	"$srcdir/$_sourcedirectory/$pkgname.sh" version | tee '/dev/stderr' | grep -q "^$pkgver$"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
