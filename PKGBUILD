# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc-accelerated-ccemux
pkgver=2.4.1
pkgrel=3
epoch=
pkgdesc="CCEmuX plugin wrapper for CraftOS-PC, providing the ccemux API for compatibility with CCEmuX-enhanced programs."
arch=('x86_64' 'i386' 'armv7l')
url="https://www.craftos-pc.cc/"
license=('MIT')
groups=()
depends=('craftos-pc-accelerated>=2.4.1' 'sdl2>=2.0.8')
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
        "craftos2-luajit.tar.gz::https://github.com/MCJack123/craftos2-luajit/archive/v2.4.1.tar.gz")
noextract=()
sha256sums=('64514e8d2771682fb214f1e39183be30d72b96d91287fe83be9c7938483548c8'
            '2587c32585f070ab0e6da5614f327770c69292a55e09aa78ba13585fcceca86f')
validpgpkeys=()

prepare() {
    cp -R craftos2-luajit-2.4.1/* "craftos2-$pkgver-luajit/craftos2-luajit/"
}

build() {
	cd "craftos2-$pkgver-luajit"
	./configure --prefix=/usr
    make -C craftos2-luajit
	make linux-plugin
}

check() {
	true
}

package() {
	cd "craftos2-$pkgver-luajit"
    install -D -m 0755 ccemux.so "$pkgdir/usr/share/craftos/plugins-luajit/ccemux.so"
}
