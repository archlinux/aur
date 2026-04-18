# Maintainer: CPT-Dawn <dawnsp0456@gmail.com>
pkgname=zenith-bar
_reponame=Zenith
pkgver=1.2.0
pkgrel=1
pkgdesc="Sleek animated Wayland status bar for Hyprland in Rust"
arch=('x86_64')
url="https://github.com/CPT-Dawn/Zenith"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'glibc')
makedepends=('cargo')
optdepends=(
  'playerctl: media module support'
  'ttf-inter: recommended UI font'
  'ttf-jetbrains-mono-nerd: recommended icon and mono font'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CPT-Dawn/Zenith/archive/refs/tags/v1.2.0.tar.gz")
sha256sums=('d9b5af472d3a2c6240de07e3d9bc969fb9dedad32c172497d5655b324d69e73b')

prepare() {
  cd "${_reponame}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
}

build() {
  cd "${_reponame}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo build --release --locked --frozen
}

package() {
  cd "${_reponame}-${pkgver}"

  install -Dm755 "${srcdir}/target/release/zenith" "${pkgdir}/usr/bin/zenith"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
