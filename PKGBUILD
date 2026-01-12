# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=ferrite
pkgver=0.2.3
pkgrel=1
pkgdesc='A fast, lightweight text editor for Markdown, JSON, YAML, and TOML files.'
arch=('x86_64' 'aarch64')
options=(!lto)
url=https://github.com/OlaProeis/Ferrite
license=('MIT')
depends=(glibc gcc-libs openssl zlib hicolor-icon-theme)
makedepends=(cargo)
conflicts=("$pkgname-bin")

source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('bf265777ef36d6f65b1a9f3984db7d24bef82ec76a1c4e796a1ce6a9013f5da8')

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
  install -Dm644 assets/icons/linux/ferrite_16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/ferrite.png"
  install -Dm644 assets/icons/linux/ferrite_32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/ferrite.png"
  install -Dm644 assets/icons/linux/ferrite_48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/ferrite.png"
  install -Dm644 assets/icons/linux/ferrite_64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/ferrite.png"
  install -Dm644 assets/icons/linux/ferrite_128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/ferrite.png"
  install -Dm644 assets/icons/linux/ferrite_256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/ferrite.png"
}
