# Contributor: lainplus <lainplus at waifu dot club>

pkgname=toph
pkgver=1.0.0
pkgrel=2
pkgdesc='A minimal and extensible pixel editor'
arch=('x86_64')
url='https://github.com/Dream-Imperium/toph'
license=('Unlicense')
depends=('gtk3' 'libxss' 'nss' 'libxdmcp' 'libxau' 'libxcb')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v1.0.0.tar.gz")
sha256sums=('cd0cdeb804b60022fb96b6831727ebd93513dd2b9d4fb4d42bff9cb3ef65bfd3')
options=(!lto)

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
