# Maintainer: Tim van Leuverden <TvanLeuverden at Gmail dot com>

pkgname=ruri
pkgver=2.1.1
pkgrel=1
pkgdesc="Calculates the CRC-32 of a file and checks it against the filename"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://gitlab.com/Timmy1e/ruri"
license=('AGPL3')

provides=('ruri')

depends=('gcc-libs')

makedepends=('cargo')

source=(
  "https://gitlab.com/Timmy1e/ruri/-/archive/v${pkgver}/ruri-v${pkgver}.tar.gz"
)

sha256sums=(
  '5a2341444a6165360035f1b6e04d782f2bcc79fc46d13502166108093691a3b1'
)

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "${srcdir}/${pkgname}-v${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  cargo build --frozen --release --all-features --bins
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-v${pkgver}/target/release/${pkgname}" \
              -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/${pkgname}-v${pkgver}/target/release/build"/ruri-*/out/ruri.1 \
              -t "${pkgdir}/usr/share/man/man1/"
}

# vim: sw=2 ts=2 tw=80 et:
