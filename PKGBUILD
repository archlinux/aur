# Maintainer: Cyb3rKo <cyb3rko-aur [ät] pm [dot] me>

pkgname=termirs
pkgver=0.3.2
pkgrel=1
pkgdesc="A modern, async SSH terminal client"
url="https://github.com/caelansar/termirs"
license=(MIT)
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('6d0223e2338d2a591bdbb63f5986b83b39447a96d1920c87c294fe2c85bc7a28')
sha512sums=('ded0e5dae105779d3105843c79fb89a65635a15368cfea3aa7001999ec069122199eb36380f8afd3d3d5887507dc059960989b910bba1f759112d83d0daefd55')
b2sums=('90597a2e4a1cef010933d77676590855be681e3023acf6f0347f9a66247770172e3a419566c6d3b9c80d5b7ab43600461de3e94b69ae422ce83cd870cc8c0cc0')
arch=(x86_64)
makedepends=(git cargo)
provides=("termirs=$pkgver")
conflicts=(termirs)
options=(!debug !lto)

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/termirs"
}
