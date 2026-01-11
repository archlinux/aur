# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=ferrite
pkgver=0.2.1
pkgrel=3
pkgdesc='A fast, lightweight text editor for Markdown, JSON, YAML, and TOML files.'
arch=('x86_64' 'aarch64')
options=(!lto)
url=https://github.com/OlaProeis/Ferrite
license=('MIT')
depends=(glibc gcc-libs openssl zlib)
makedepends=(cargo)
conflicts=("$pkgname-bin")

source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('f89fffd1dbb5f3a2f4349ade44897a55560af94648fadbe7c5125db3928573ef')

prepare() {
  cd ${pkgname^}-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd ${pkgname^}-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin $pkgname
}

package() {
  cd ${pkgname^}-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 assets/icons/linux/ferrite.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 assets/icons/icon_16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/ferrite.png"
  install -Dm644 assets/icons/icon_32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/ferrite.png"
  install -Dm644 assets/icons/icon_48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/ferrite.png"
  install -Dm644 assets/icons/icon_64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/ferrite.png"
  install -Dm644 assets/icons/icon_128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/ferrite.png"
  install -Dm644 assets/icons/icon_256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/ferrite.png"
  install -Dm644 assets/icons/icon_512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/ferrite.png"
}
