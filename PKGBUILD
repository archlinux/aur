# Maintainer: Alberto Sánchez Molero <alsamolero@gmail.com>
pkgname=kitsas
_reponame=kitupiikki
pkgver=3.2.1
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
	"0001_dont_process_pdf_as_image.patch"
)
noextract=()
sha256sums=('79574ceefe457eae5e9174577979871618c7cb32bbdd35cce234ff6219017432'
            'f0cea2431af21d7640c869856ce16609d340fe45c2c997e72123cea78febc454')
validpgpkeys=()

prepare() {
	cd "$_reponame-$_repover"
	patch -N -p1 -i "${srcdir}/0001_dont_process_pdf_as_image.patch"
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
}

