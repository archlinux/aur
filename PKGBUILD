# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=valkyrie
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="a Qt4-based GUI for the Memcheck and Helgrind tools in Valgrind"
arch=(x86_64)
url="https://www.valgrind.org/downloads/guis.html"
license=('GPL2')
groups=()
depends=(
	'valgrind>=3.6.0'
	'qt4'
)
makedepends=('gendesk')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"https://sourceware.org/pub/valgrind/$pkgname-$pkgver.tar.bz2"
	"includes.patch"
)
noextract=()
sha512sums=('435abb17ecad114c3e492fa193e508bad7ca61884bd09bf1bf0b8398c63151d33e571fea927b84f05bc2b647183af441da1550161a6f766db9e9a15d00cfc888'
            'f1ff0ebdeb6b2e865e6442df629f3f67d146f178f6fd1ea03a74a511d58a661e11fe8d10c16935b8adbdfd01b0d70d23e9f42b6925b9660c89ba41ac5be3dd31')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/includes.patch"
}

build() {
	cd "$pkgname-$pkgver"
	qmake-qt4 PREFIX="/usr"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
	install -Dt "$pkgdir/usr/share/applications/" -m644 "$pkgname.desktop"
	install -Dt "$pkgdir/usr/share/pixmaps/" -m644 "icons/$pkgname.xpm"
}
