# Maintainer: JiiB <jiibbottou@gmail.com>
pkgname=flatpak-enhanced
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight wrapper for the flatpak tool. Main feature : aliases for applications and runtimes."
url="https://github.com/JiiB1/flatpak-enhanced"
arch=(x86_64)
license=(MIT)
depends=(
  flatpak
)
makedepends=(
  git
  cargo
)
source=("git+$url.git?signed#tag=v$pkgver")
md5sum=(
    '887c49e6282dd579d0fe22366b9af47d'
)
validpgpkeys=(
  927C6C7589E345D30D71367B483D974BE8CD1C27 # JiiB <jiibbottou@gmail.com>
)

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('887c49e6282dd579d0fe22366b9af47d')
