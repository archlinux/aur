# Maintainer: Soc Virnyl S. Estela <renegan.ronin@gmail.com>

_pkgname=rivercarro
pkgname=$_pkgname-git
pkgver=r17.4f714a5
pkgrel=1
pkgdesc="A slightly modified version of rivertile layout generator for river."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://git.sr.ht/~novakane/rivercarro"
license=('GPL3')
makedepends=('git' 'zig')
source=(
    "${pkgname}::git+https://git.sr.ht/~novakane/rivercarro"
)
sha256sums=(
    'SKIP'
)
provides=("rivercarro")
conflicts=("rivercarro")
options=(!strip)

prepare() {
	cd "$pkgname"
	git submodule init
	git submodule update
}

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"
    DESTDIR="$pkgdir" zig build install --prefix "/usr"
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
