# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='salvador'
pkgver='2.4.1'
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
sha512sums=('b6c96946de9b1104652ed489ff200c6ac8185ae98ec516ca4ce583707b8e0cebbb1a8321bb4c81057bcc8103dc6cab8d41a5a7a2d774d60b1a8a0c4df48e29fe')

_sourcedirectory="$pkgname-$pkgver"

check() {
	"$srcdir/$_sourcedirectory/$pkgname.sh" version | tee '/dev/stderr' | grep -q "^$pkgver$"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
