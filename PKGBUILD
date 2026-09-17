# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=shuvarie
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Blazingly fast AI coding TUI for chivalrous people"
arch=("x86_64" "aarch64")
url="https://shuvarie.org/"
license=('MIT')
groups=()
depends=(glibc)
makedepends=(rust cargo)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
options=(lto strip)
install=
changelog=
_repourl='https://github.com/shuvarie/shuvarie'
source=(
    "shuvarie-v${pkgver}.tar.gz::${_repourl}/archive/refs/tags/v${pkgver}.tar.gz"
)
noextract=()
sha256sums=(
    "fecfdc1b11bdf227083fa7a5182dae655170b0bbff1e6b684b9c994cfe26b4fe"
)
validpgpkeys=()

_dirname="shuvarie-$pkgver"

build() {
    cd $_dirname
    cargo build --release --locked
}

package() {
    cd $_dirname
	make DESTDIR="$pkgdir/" install

    mkdir -p "$pkgdir/usr/bin"
    install -m755 -t "$pkgdir/usr/bin" ./target/release/shuvarie

    mkdir -p "$pkgdir/usr/share/licenses/shuvarie"
    install -m644 -t "$pkgdir/usr/share/licenses/shuvarie" ./LICENSE
}
