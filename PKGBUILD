# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=spritefusion-pixel-snapper
pkgver=1.0.0
pkgrel=1
pkgdesc="Snap pixel art to a clean grid"
arch=('x86_64' 'aarch64')
url="https://github.com/hugo-dz/spritefusion-pixel-snapper"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5505968af26218816d7255c43f48c9dec2a7dabf958d5cd355ee1cb468d65021')

prepare() {
  cd "spritefusion-pixel-snapper-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "spritefusion-pixel-snapper-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "spritefusion-pixel-snapper-${pkgver}"
  install -Dm755 "target/release/spritefusion-pixel-snapper" "${pkgdir}/usr/bin/spritefusion-pixel-snapper"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
