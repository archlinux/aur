# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc-git
pkgver=2.3.0~0+0000000
pkgrel=1
epoch=
pkgdesc="Advanced ComputerCraft emulator written in C++"
arch=('x86_64' 'i386' 'armv7l' 'aarch64')
url="https://github.com/MCJack123/craftos2"
license=('MIT')
groups=()
depends=('craftos-pc-data-git' 'sdl2>=2.0.8' 'sdl2_mixer' 'poco')
makedepends=()
optdepends=('libharu: PDF output support' 'png++: PNG screenshot support' 'ncurses: CLI mode support')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("craftos2::git+https://github.com/MCJack123/craftos2.git")
noextract=()
sha256sums=(SKIP)
validpgpkeys=()

prepare() {
    cd "craftos2"
    git submodule update --init --recursive
}

pkgver() {
    cd "craftos2"
    echo "$(grep -Po 'CRAFTOSPC_VERSION +\"v\K[^\"]+' src/lib.hpp).0~$(git rev-list --count HEAD)+$(git rev-parse --short HEAD)"
}

build() {
	cd "craftos2"
    make -C craftos2-lua linux
	./configure --prefix=/usr/local
	make
}

check() {
	cd "craftos2"
	make -k test
}

package() {
	cd "craftos2"
	mkdir -p "$pkgdir/usr/local/bin"
	DESTDIR="$pkgdir/usr/local/bin" make install
}
