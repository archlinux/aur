# Maintainer: Alberto Sánchez Molero <alsamolero@gmail.com>
pkgname=kitsas
_reponame=kitupiikki
pkgver=5.0
_repover="${pkgver//_/-}"
pkgrel=1
epoch=
pkgdesc="Finnish bookkeeping software for small organisations"
arch=('x86_64')
url="https://kitsas.fi/"
license=('GPL3')
groups=()
depends=('qt6-base' 'qt6-webengine' 'qt6-svg' 'qt6-5compat' 'libzip')
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
sha256sums=('86433b5c07e9f7688eb5414b66e056414de1b2988e38c8d6ad253e0fbaaae097')
validpgpkeys=()

prepare() {
	cd "$_reponame-$_repover"
}

build() {
	cd "$_reponame-$_repover/$pkgname"
	qmake6 $pkgname.pro -spec linux-g++ "CONFIG+=release"
	make 

}

package() {
	cd "$_reponame-$_repover/$pkgname"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 ../$pkgname.png "$pkgdir/usr/share/icons/$pkgname.png"
}

