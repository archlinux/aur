# Maintainer: Emma Tebibyte <emma@tebibyte.media>

pkgname="hopper"
pkgver=0.1.0
pkgrel=1
pkgdesc="A Minecraft mod manager for the terminal"
arch=("x86_64")
url="https://git.tebibyte.media/minecrust/hopper"
license=("AGPL3")
source=("git+https://git.tebibyte.media/minecrust/hopper")

depends=()
optdepends=()
makedepends=("rust" "cargo" "git")
provides=("hopper")

sha256sums=("SKIP")

pkgver() {
  cd $pkgname
  cargo pkgid | cut -d# -f2 | cut -d: -f2
}

prepare() {
    cd $srcdir/$pkgname
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

check() {
    cd $srcdir/$pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $srcdir/$pkgname
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
}
