# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Sean Anderson <seanga2@gmail.com>
pkgname=valkyrie-qt6
_pkgname=valkyrie
pkgver=2.0.1.SVN
pkgrel=2
epoch=
pkgdesc="a GUI for the Memcheck and Helgrind tools in Valgrind (Qt5/Qt6 version)"
arch=(x86_64)
url="https://www.valgrind.org/downloads/guis.html"
license=('GPL2')
groups=()
depends=(
	'valgrind>=3.6.0'
	'qt6-base'
        'qt6-5compat'
)
makedepends=('gendesk' 'git')
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
            '4cfdc28337e4cefc2518c8b03efcea49fc083085d0bdb4ddaac496461ddc6f537cebe9b80d4dee77b53780dda6b308dff25ae02bbb76b385cb651bc0912dbabb')
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
