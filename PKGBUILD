# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc-accelerated
pkgver=2.4.2
pkgrel=2
epoch=
pkgdesc="Advanced ComputerCraft emulator written in C++, using the LuaJIT engine"
arch=('x86_64' 'i386' 'armv7l')
url="https://www.craftos-pc.cc/"
license=('MIT')
groups=()
depends=('craftos-pc-data>=2.4.1' 'sdl2>=2.0.8' 'sdl2_mixer' 'poco')
makedepends=()
optdepends=('libharu: PDF output support' 'png++: PNG screenshot support' 'ncurses: CLI mode support')
checkdepends=()
provides=()
conflicts=('craftos-pc-accelerated-ccemux<2.4.2')
replaces=()
backup=()
options=()
install=
changelog=
source=("craftos2.tar.gz::https://github.com/MCJack123/craftos2/archive/v${pkgver}-luajit.tar.gz"
        "craftos2-luajit.tar.gz::https://github.com/MCJack123/craftos2-luajit/archive/v2.4.2.tar.gz")
noextract=()
sha256sums=('32c2a008be721424fbf2dd6951f0d1b46a92d62695c9d807573c6651161cb418'
            '8630aac4a99c1d3d8753575dc0da964b94ded1f63903ac345b5764f912e59a15')
validpgpkeys=()

prepare() {
    cp -R craftos2-luajit-2.4.2/* "craftos2-$pkgver-luajit/craftos2-luajit/"
    cd "craftos2-$pkgver-luajit"
    mkdir icons
    unzip resources/linux-icons.zip -d icons
}

build() {
	cd "craftos2-$pkgver-luajit"
	./configure --prefix=/usr
	make
}

check() {
	cd "craftos2-$pkgver-luajit"
	make -k test
}

package() {
	cd "craftos2-$pkgver-luajit"
	install -D -m 0755 craftos "$pkgdir/usr/bin/craftos-luajit"
	install -D -m 0644 icons/CraftOS-PC.desktop "$pkgdir/usr/share/applications/CraftOS-PC-Accelerated.desktop"
	install -D -m 0644 icons/16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/craftos-luajit.png"
	install -D -m 0644 icons/24.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/craftos-luajit.png"
	install -D -m 0644 icons/32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/craftos-luajit.png"
	install -D -m 0644 icons/48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/craftos-luajit.png"
	install -D -m 0644 icons/64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/craftos-luajit.png"
	install -D -m 0644 icons/96.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/craftos-luajit.png"
}
