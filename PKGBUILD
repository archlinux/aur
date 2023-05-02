# Maintainer: Alberto Sánchez Molero <alsamolero@gmail.com>
pkgname=kitsas
_reponame=kitupiikki
pkgver=4.0.5
_repover="${pkgver//_/-}"
pkgrel=1
epoch=
pkgdesc="Finnish bookkeeping software for small organisations"
arch=('x86_64')
url="https://kitsas.fi/"
license=('GPL3')
groups=()
depends=('qt5-svg>=5.12' 'poppler-qt5' 'libzip')
makedepends=()
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
	"https://github.com/artoh/$_reponame/archive/v$_repover.tar.gz"
)
noextract=()
sha256sums=('3ad04f1cdad5ddc3226922850d21c2c4dcad1c2efd85297071cb6e01a7f08749')
validpgpkeys=()

prepare() {
	cd "$_reponame-$_repover"
}

build() {
	cd "$_reponame-$_repover/$pkgname"
	qmake $pkgname.pro -spec linux-g++ "CONFIG+=release"
	make 

}

package() {
	cd "$_reponame-$_repover/$pkgname"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 ../$pkgname.png "$pkgdir/usr/share/icons/$pkgname.png"
}

