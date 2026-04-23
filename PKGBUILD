# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=ferrite
pkgver=0.2.9
pkgrel=1
pkgdesc='A fast, lightweight text editor for Markdown, JSON, YAML, and TOML files.'
arch=('x86_64' 'aarch64')
options=(!lto)
url=https://github.com/OlaProeis/Ferrite
license=('MIT')
depends=(glibc gcc-libs zlib hicolor-icon-theme fontconfig freetype2)
makedepends=(cargo)
conflicts=("$pkgname-bin")

source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('38da2bda94e2d4f09e8212ce27d7d989b74650ee8d38d00c5610a80568f39b83')

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
  install -Dm644 assets/icons/linux/16x16/ferrite.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/ferrite.png"
  install -Dm644 assets/icons/linux/32x32/ferrite.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/ferrite.png"
  install -Dm644 assets/icons/linux/48x48/ferrite.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/ferrite.png"
  install -Dm644 assets/icons/linux/64x64/ferrite.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/ferrite.png"
  install -Dm644 assets/icons/linux/128x128/ferrite.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/ferrite.png"
  install -Dm644 assets/icons/linux/256x256/ferrite.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/ferrite.png"
  install -Dm644 assets/icons/linux/512x512/ferrite.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/ferrite.png"
}
