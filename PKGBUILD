# Maintainer: Victor3D <webmaster@victor3d.com.br>
pkgname=executor
pkgver=2
pkgrel=3
epoch=
pkgdesc="Old-school Macintosh Emulator"
arch=('x86_64')
url="http://wiki.victor3d.com.br"
license=('GPL')
groups=()
depends=("qt5-base" "boost")
makedepends=("cmake" "sdl2" "boost" "git" "ruby" "bison" "perl")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/victor3dptz/executor-packaging/raw/master/arch/executor.tar.gz")
noextract=()
md5sums=("868697896b0c51c66d31440f3c59a3fc")
validpgpkeys=()

prepare() {
	cd "$pkgname"
	git init
	git remote add origin https://github.com/autc04/executor.git
	git pull origin master
	git submodule init
	git submodule update
}

build() {
	cd "$pkgname"
	mkdir build
	cd build
	cmake ..
	cmake --build .
}

check() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
	mkdir -p "$pkgdir/usr/share/man"
	cp -Rp "usr/share/man/" "$pkgdir/usr/share"
	mkdir -p "$pkgdir/usr/share/applications"
	cp -Rp "usr/share/applications/" "$pkgdir/usr/share/"
	mkdir -p "$pkgdir/usr/share/doc/executor"
	cp -Rp "usr/share/doc/executor/" "$pkgdir/usr/share/doc/"
	mkdir -p "$pkgdir/usr/share/executor"
	cp -Rp "usr/share/executor/" "$pkgdir/usr/share/"
	mkdir -p "$pkgdir/usr/bin"
	cp -Rp "build/executor*" "$pkgdir/usr/bin/"
}
