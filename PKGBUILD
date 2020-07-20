# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: lilac <lilac@build.archlinuxcn.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: jjacky (kalu PKGBUILD)
_pkgname='kalu'
pkgname="$_pkgname-cli"
pkgver='4.3.0'
pkgrel='6'
pkgdesc='Upgrade notifier w/ AUR support, watched (AUR) packages, news - CLI only'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://jjacky.com/$_pkgname"
license=('GPL3')
depends=('curl' 'glib2' 'pacman>=5.2' 'pacman<5.3')
makedepends=('perl' 'groff')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname-$pkgver-$pkgrel.tar.xz::https://jjacky.com/$_pkgname/$_pkgname-$pkgver.tar.xz"
	'gcc10.patch'
)
sha256sums=('83c886e832c29768b0b80e0ee463ca057eae1a3511d2b8babdc8d6347f02cb5a'
            'ae757c2e2e701e202818916712f87c56bfada06b8832a292505170f51bba7bbd')

_sourcedirectory="$_pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "$srcdir/gcc10.patch"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	./configure --prefix '/usr' --disable-gui
	make
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	make DESTDIR="$pkgdir/" install
}
