# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc-accelerated-ccemux
pkgver=2.5
pkgrel=2
epoch=
pkgdesc="CCEmuX plugin wrapper for CraftOS-PC Accelerated, providing the ccemux API for compatibility with CCEmuX-enhanced programs."
arch=('x86_64' 'i386' 'armv7l')
url="https://www.craftos-pc.cc/"
license=('MIT')
groups=()
depends=('craftos-pc-accelerated>=2.5' 'sdl2>=2.0.8')
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("craftos2.tar.gz::https://github.com/MCJack123/craftos2/archive/v${pkgver}-luajit.tar.gz"
        "craftos2-luajit.tar.gz::https://github.com/MCJack123/craftos2-luajit/archive/v2.5.tar.gz")
noextract=()
sha256sums=('79b8ad463f871eabe431dd854a62eb8f07ac3eb2c096412fb7ad4ea66f8e3e1a'
            '08273362fc58965c98515e9167aed298823ca5f763df2d16e4360e7122f5ff5c')
validpgpkeys=()

prepare() {
    cp -R craftos2-luajit-2.5/* "craftos2-$pkgver-luajit/craftos2-luajit/"
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
