# Maintainer: Piano Nekomiya <kotone.olin1010@gmail.com>

pkgname=pnket
pkgver=0.3.1
pkgrel=1
pkgdesc="A download manager"
arch=("x86_64")
url="https://github.com/Ablaze-MIRAI/pnket"
license=(MIT)
depends=(glibc gcc-libs openssl)
makedepends=(cargo)
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Ablaze-MIRAI/pnket/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('796d0ef3a27a74244d26a30f83f79df62a7c924e76b537416547689ff14d56e8')

prepare() {
  cd "pnket-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo fetch --target "$CARCH-unknown-linux-gnu"

# Don't work with --locked (see Arch's Rust packaging guidelines) and neither with --offline
#error: the lock file /home/fabio/Dev/Github/AURFIX/p/pnket/src/pnket-0.3.1/Cargo.lock needs to be updated but --locked was passed to prevent this
#If you want to try to generate the lock file without accessing the network, remove the --locked flag and use --offline instead.
}

build() {
  cd "pnket-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "pnket-${pkgver}"
  install -Dm755 target/release/pnket -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
