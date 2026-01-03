# Maintainer: Ethan M <SirEthanator@noreply.users.github.com>

pkgname=cbmp-rs
pkgver=1.0.1
pkgrel=1
pkgdesc='A CLI for converting cursor SVG files to PNG files.'
url='https://github.com/SirEthanator/cbmp-rs'
license=(MIT)
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7602793d7ad0508982f0fb1197da79ebc6c26dd784ee9382b0dce07d51a4db0c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/cbmp"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
