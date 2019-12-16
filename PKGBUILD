# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc-ccemux
pkgver=2.2
pkgrel=6
epoch=
pkgdesc=""
arch=('x86_64' 'i386' 'armv7l' 'aarch64')
url="https://github.com/MCJack123/craftos2"
license=('MIT')
groups=()
depends=('craftos-pc>=2.2' 'sdl2>=2.0.8')
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
        "craftos2-lua.tar.gz::https://github.com/MCJack123/craftos2-lua/archive/v2.2.tar.gz")
noextract=()
sha256sums=('6aee4aa7a3b74d8e9738f42ded967d4107bb1b6f4eead29b67cf4b5c307112a5'
            '221595821d583ef9669a83bc061d49b761c460ead17f12862646b5caeddd7a3c')
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
