# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc-accelerated
pkgver=2.6.6
pkgrel=3
epoch=
pkgdesc="Advanced ComputerCraft emulator written in C++, using the LuaJIT engine"
arch=('x86_64' 'i386' 'armv7l')
url="https://www.craftos-pc.cc/"
license=('MIT')
groups=()
depends=('craftos-pc-data>=2.5' 'sdl2>=2.0.8' 'sdl2_mixer' 'poco')
makedepends=('unzip')
optdepends=('libharu: PDF output support' 'png++: PNG screenshot support' 'ncurses: CLI mode support')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("craftos2-${pkgver}.tar.gz::https://github.com/MCJack123/craftos2/archive/v${pkgver}-luajit.tar.gz"
        "craftos2-luajit-v2.5.4.tar.gz::https://github.com/MCJack123/craftos2-luajit/archive/v2.5.4.tar.gz")
noextract=()
sha256sums=('0a5b5314221c5cb1f590f0dc294d51a38cd26c6cb8f24181592080b67658dd0a'
            'd65736d71a54bdf393f657ae0ecd7d333a07143b9842f759f09749ca5b7b6003')
validpgpkeys=()

prepare() {
    cp -R craftos2-luajit-2.5.4/* "craftos2-$pkgver-luajit/craftos2-luajit/"
    cd "craftos2-$pkgver-luajit"
    mkdir icons
    unzip resources/linux-icons.zip -d icons
}

build() {
	cd "craftos2-$pkgver-luajit"
	./configure --prefix=/usr
	make -C craftos2-luajit -j$(nproc)
	make -j$(nproc)
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
