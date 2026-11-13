# Maintainer: Zachary Kessler <zacksynack@gmail.com>
pkgname=evtrill
pkgver=0.1.0
pkgrel=1
pkgdesc="SOCD cleaner for rhythm games: a two-key trill daemon for any Linux keyboard, with Wooting analog support"
arch=('x86_64' 'aarch64')
url="https://github.com/zakack/evtrill"
license=('MIT')
depends=('libevdev' 'libyaml' 'systemd')
makedepends=('cmake')
install=evtrill.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('627ae31ccedd7966e5034ccebc10d95e4b0e73a7fa30a099c64735dcf3ff0e73')

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --target evtrill machinetest
}

check() {
    ./build/machinetest
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE.md" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
