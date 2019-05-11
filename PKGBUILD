# Maintainer: tvoor <ftdabcde@gmail.com>
pkgname=png_sec-git
pkgver=0.1.1.9.a3b32c6
pkgrel=1
epoch=
pkgdesc="tool to encrypt text and hide it in .png file"
arch=('any')
url=""
license=('GPL')
groups=()
depends=('libgcrypt' 'libpng')
makedepends=('cmake' 'make' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=('png_sec')
backup=()
options=()
install=
changelog=
source=(
	"$pkgname::git+https://github.com/DOGINFOG/png_sec.git"
	"git+https://github.com/DOGINFOG/cmake_scripts.git"
)
noextract=()
md5sums=('SKIP' 'SKIP')
validpgpkeys=('C5C2DEE155D3872B8BA531226EEC3334E3C22821')

prepare() {
	cd "$pkgname"
	git submodule init
	git config submodule.cmake.url $srcdir/cmake_scripts
	git submodule update
	cmake -Bbuild
}

build() {
	cd "$pkgname"
	make -Cbuild
}

check() {
	cd "$pkgname"
	make -Cbuild test
}

package() {
	cd "$pkgname"
	make -Cbuild DESTDIR=$pkgdir install
}
