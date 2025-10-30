# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=valkyrie-qt6
_pkgname=valkyrie
pkgver=2.0.1.SVN
pkgrel=1
epoch=
pkgdesc="a GUI for the Memcheck and Helgrind tools in Valgrind (Qt5/Qt6 version)"
arch=(x86_64)
url="https://www.valgrind.org/downloads/guis.html"
license=('GPL2')
groups=()
depends=(
	'valgrind>=3.6.0'
	'qt6-base'
)
makedepends=('gendesk')
checkdepends=()
optdepends=()
provides=()
conflicts=(valkyrie)
replaces=(valkyrie)
backup=()
options=()
install=
changelog=
source=(
	git+https://github.com/barsnick/valkyrie#branch=valkyrie-qt5-qt6
	"valkyrie-qmake-qt6-version-deprecation.patch"
)
noextract=()
sha512sums=('SKIP'
            'e6afd0422189b9c7fbaef8a2e9e568ce4d2aa6b26f1a4fb2efe7258389241bd7aac02b3166f199a91db388abc0c3627885f81aaef242bb2e65c74f2743622b0b')
validpgpkeys=()

prepare() {
	cd "$_pkgname"
	patch -Np1 < "$srcdir/valkyrie-qmake-qt6-version-deprecation.patch"
}

build() {
	cd "$_pkgname"
	qmake6 PREFIX="/usr"
	make
}

package() {
	cd "$_pkgname"
	make INSTALL_ROOT="$pkgdir" install
	gendesk -f -n --pkgname "$_pkgname" --pkgdesc "$pkgdesc"
	install -Dt "$pkgdir/usr/share/applications/" -m644 "$_pkgname.desktop"
	install -Dt "$pkgdir/usr/share/pixmaps/" -m644 "icons/$_pkgname.xpm"
}
