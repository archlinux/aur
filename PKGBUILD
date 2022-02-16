# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-zigbuild
pkgver=0.1.2
pkgrel=1
pkgdesc="Compile Cargo project with zig as linker"
url="https://github.com/messense/cargo-zigbuild"
license=("MIT")
arch=('x86_64' 'i686')
depends=('gcc-libs' 'zig')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/messense/cargo-zigbuild/archive/refs/tags/v$pkgver.tar.gz")
cksums=('2466681655')
sha256sums=('550f1a3c47788b7f25fce01320761f83befa65ff13bb643ae49645293ca6a7fe')
b2sums=('cfeb60c8348d8e0126945ccb62b165c81cd90179d095117cece15e2e0f8fe68ae44367a442146fac664e2b287b916a1f2dae20de6bf0b3222e7f70f5bdd07cb1')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/cargo-zigbuild

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
