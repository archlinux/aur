# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc-accelerated-ccemux
pkgver=2.4.2
pkgrel=1
epoch=
pkgdesc="CCEmuX plugin wrapper for CraftOS-PC, providing the ccemux API for compatibility with CCEmuX-enhanced programs."
arch=('x86_64' 'i386' 'armv7l')
url="https://www.craftos-pc.cc/"
license=('MIT')
groups=()
depends=('craftos-pc-accelerated>=2.4.2' 'sdl2>=2.0.8')
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=('craftos-pc-accelerated<2.4.2')
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
}

build() {
	cd "craftos2-$pkgver-luajit"
	./configure --prefix=/usr
    CFLAGS=-fPIC make -C craftos2-luajit
	make linux-plugin
}

check() {
	true
}

package() {
	cd "craftos2-$pkgver-luajit"
    install -D -m 0755 ccemux.so "$pkgdir/usr/share/craftos/plugins-luajit/ccemux.so"
}
