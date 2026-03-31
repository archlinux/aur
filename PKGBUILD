# Maintainer: Cyb3rKo <cyb3rko-aur [ät] pm [dot] me>

pkgname=termirs
pkgver=0.3.1
pkgrel=1
pkgdesc="A modern, async SSH terminal client"
url="https://github.com/caelansar/termirs"
license=(MIT)
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('dfec630d186d97e475b3edb6d0818ad1eecf6ea1ff70bf919e2347df3c7f7961')
sha512sums=('774e17252c057db244bc2ac8cc535385334a1973382facf111f0cc5884425f35689ee47244c4ecd4c4fe8dc1912e294b7a381c3fe7ee916ea4bf2568a4d6aae3')
b2sums=('22b8229f69d26de73ecda657f8be42c37f84f2091a8e336b897149442002b4296fb6e3393395401b8da974e9fe4ae31b7d1fe032fc2e9817783a056ddc86a29e')
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
