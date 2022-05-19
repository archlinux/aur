# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=ferium
pkgver=4.0.0
pkgrel=1
pkgdesc='Ferium is an easy to use CLI program for downloading and updating Minecraft mods from Modrinth, CurseForge, and GitHub Releases.'
url='https://github.com/theRookieCoder/ferium'
license=('MPL2')
arch=(x86_64)
depends=(gcc-libs bzip2)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gorilla-devs/ferium/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('44c12e414885649728270b6503c8f51525c80e1c3e43fef39426682e0e6faeac')
b2sums=('82fa30ee366a50e3d0f48087691a87e3b92a9232f3b5150b349ea7fad5e6718faca5806713a711b2b570a1460a0ee2648792d83e3ffcb98b6852b474e46ddc9c')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --no-default-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/ferium

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
