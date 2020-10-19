# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc
pkgver=2.4.4
pkgrel=1
epoch=
pkgdesc="Advanced ComputerCraft emulator written in C++"
arch=('x86_64' 'i386' 'armv7l' 'aarch64')
url="https://www.craftos-pc.cc/"
license=('MIT')
groups=()
depends=('craftos-pc-data>=2.3.2' 'sdl2>=2.0.8' 'sdl2_mixer' 'poco')
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
source=("craftos2.tar.gz::https://github.com/MCJack123/craftos2/archive/v${pkgver}.tar.gz"
        "craftos2-lua.tar.gz::https://github.com/MCJack123/craftos2-lua/archive/v2.4.4.tar.gz")
noextract=()
sha256sums=('3962bf84b8d9372eca41512ce37f54ff1662e2c5266d2fc81aac20ba669793f5'
            '9dbd865d51f3a3b749cc120286086bfb49b7b295b0107c1049a1d78ddad2e5be')
validpgpkeys=()

prepare() {
    cp -R "craftos2-lua-2.4.4"/* "craftos2-$pkgver/craftos2-lua/"
    cd "craftos2-$pkgver"
    mkdir icons
    unzip resources/linux-icons.zip -d icons
    make -C craftos2-lua linux
}

build() {
	cd "craftos2-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "craftos2-$pkgver"
	make -k test
}

package() {
	cd "craftos2-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	DESTDIR="$pkgdir/usr/bin" make install
	install -D -m 0644 icons/CraftOS-PC.desktop "$pkgdir/usr/share/applications/CraftOS-PC.desktop"
	install -D -m 0644 icons/16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/craftos.png"
	install -D -m 0644 icons/24.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/craftos.png"
	install -D -m 0644 icons/32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/craftos.png"
	install -D -m 0644 icons/48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/craftos.png"
	install -D -m 0644 icons/64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/craftos.png"
	install -D -m 0644 icons/96.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/craftos.png"
}
