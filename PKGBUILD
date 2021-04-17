# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=oxyromon-git
pkgver=0.7.0.r7.3a885be
pkgrel=1
pkgdesc='Rusty ROM OrgaNizer'
arch=(x86_64)
url=https://github.com/alucryd/oxyromon
license=(GPL3)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  git
  mame-tools
  maxcso
  p7zip
  rust
)
optdepends=(
  'mame-tools: CHD support'
  'maxcso: CSO support'
  'p7zip: 7Z and ZIP support'
)
provides=(oxyromon)
conflicts=(oxyromon)
source=(git+https://github.com/alucryd/oxyromon.git)
validpgpkeys=(9437DD3815A7A9169E3D3946AFF5D95098BC6FF5) # Maxime Gauduin <alucryd@archlinux.org>
b2sums=(SKIP)

prepare() {
  cargo fetch \
    --locked \
    --manifest-path oxyromon/Cargo.toml
}

pkgver() {
  cd oxyromon

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  cargo build \
    --release \
    --frozen \
    --manifest-path oxyromon/Cargo.toml
}

check() {
  cargo test \
    --release \
    --frozen \
    --manifest-path oxyromon/Cargo.toml
}

package() {
  cargo install \
    --frozen \
    --offline \
    --no-track \
    --path oxyromon \
    --root "${pkgdir}"/usr
}

# vim: ts=2 sw=2 et:
