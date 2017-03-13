# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=etc2comp-git
pkgver=r11.e2e733c
pkgrel=1
pkgdesc="Etc2Comp is a command line tool that converts textures (e.g. bitmaps) into the ETC2 format."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/google/etc2comp"
license=('Apache2')
depends=()
makedepends=('cmake')
options=()
source=("git+https://github.com/google/etc2comp.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/etc2comp"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/etc2comp"
}

build() {
    cd "$srcdir/etc2comp"
    rm -rf build
    mkdir build
    cd build
    cmake ..
    make
}

package() {
    cd "$srcdir/etc2comp/build/EtcTool"
    install -Dm755 EtcTool "$pkgdir/usr/bin/EtcTool"
    install -Dm644 ../../LICENSE "$pkgdir/usr/share/licenses/etc2comp-git/LICENSE"
}
