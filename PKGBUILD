# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc-ccemux
pkgver=2.3.3
pkgrel=1
epoch=
pkgdesc="CCEmuX plugin wrapper for CraftOS-PC, providing the ccemux API for compatibility with CCEmuX-enhanced programs."
arch=('x86_64' 'i386' 'armv7l' 'aarch64')
url="https://github.com/MCJack123/craftos2"
license=('MIT')
groups=()
depends=('craftos-pc>=2.3.2' 'sdl2>=2.0.8')
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
        "craftos2-lua.tar.gz::https://github.com/MCJack123/craftos2-lua/archive/v2.3.3.tar.gz")
noextract=()
sha256sums=('86c0d176a9733bece72757509ec53401cd9abbab523e1dfcc579d1e09409f1d9'
            '9dbf6d929ed6ecb659fc4da801fa308e77beb2f6ae091186c69e73642a393987')
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
