# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc-ccemux
pkgver=2.4
pkgrel=1
epoch=
pkgdesc="CCEmuX plugin wrapper for CraftOS-PC, providing the ccemux API for compatibility with CCEmuX-enhanced programs."
arch=('x86_64' 'i386' 'armv7l' 'aarch64')
url="https://github.com/MCJack123/craftos2"
license=('MIT')
groups=()
depends=('craftos-pc>=2.4' 'sdl2>=2.0.8')
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
source=("craftos2.tar.gz::https://github.com/MCJack123/craftos2/archive/v${pkgver}.tar.gz"
        "craftos2-lua.tar.gz::https://github.com/MCJack123/craftos2-lua/archive/v2.4.tar.gz")
noextract=()
sha256sums=('f713761e3e1023564834074d755f682df61772b7065c51aad473636c09feb46f'
            '10c4d725476d0c3ce4b1465a9b09e8e586819de5ddedf9e0de9e52c6ce5e2d19')
validpgpkeys=()

prepare() {
    cp -R "craftos2-lua-$pkgver"/* "craftos2-$pkgver/craftos2-lua/"
	cd "craftos2-$pkgver"
	make -C craftos2-lua linux
}

build() {
	cd "craftos2-$pkgver"
	./configure --prefix=/usr
	make linux-plugin
}

check() {
    true
}

package() {
	cd "craftos2-$pkgver"
	install -D -m 0755 ccemux.so "$pkgdir/usr/share/craftos/plugins/ccemux.so"
}
