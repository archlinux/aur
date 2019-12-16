# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc
pkgver=2.2
pkgrel=1
epoch=
pkgdesc="Advanced ComputerCraft emulator written in C++"
arch=('x86_64' 'i386' 'armv7l' 'aarch64')
url="https://github.com/MCJack123/craftos2"
license=('MIT')
groups=()
depends=('craftos-pc-data>=2.2' 'sdl2>=2.0.8' 'sdl2_mixer' 'poco')
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
source=("https://github.com/MCJack123/craftos2/archive/v2.2.tar.gz")
noextract=()
sha256sums=('6aee4aa7a3b74d8e9738f42ded967d4107bb1b6f4eead29b67cf4b5c307112a5')
validpgpkeys=()

prepare() {
    cd "craftos2-$pkgver"
    mkdir icons
    unzip linux-icons.zip -d icons
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
