# Maintainer: Diego Ascânio Santos <ascanio@cefetmg.br>

pkgname=tic80-pro-git
pkgver=1.1.2837
pkgrel=1
pkgdesc="TIC-80 is a fantasy computer for making, playing and sharing tiny games. This is the pro version, built from git, for those who don't have money to buy it."
arch=('x86_64')
url="https://tic80.com"
license=('MIT')
conflicts=('tic80')
depends=('libglvnd')
makedepends=('git' 'cmake' 'ruby' 'mesa' 'glu' 'coreutils')
source=(
    'git+https://github.com/nesbox/TIC-80.git#tag=v1.1.2837'
)
sha256sums=(
    'SKIP'
)
prepare() {
    cd "$srcdir/TIC-80"
    git submodule update --init --recursive
}
build() {
    cd "$srcdir/TIC-80/build"
    cmake .. -DBUILD_PRO=On -DBUILD_WITH_ALL=On
    make -j$(nproc)
}
package() {
    cd "$srcdir/TIC-80/build"
    make DESTDIR="$pkgdir" install -j$(nproc)
    # license
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$srcdir/TIC-80/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
