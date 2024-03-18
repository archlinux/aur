# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pkgdu
pkgver=0.9.0
pkgrel=1
pkgdesc="A tool to display packages disk usage size"
arch=('x86_64')
url="https://github.com/bpetlert/pkgdu"
license=('GPL-3.0-or-later')
depends=(libalpm.so)
makedepends=(cargo)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('72642708503a9f29157ea47ccc536a8cbeca85e73e2e3b3f70fb8a08537ebeeef417cee01c2b83502587a4eed42f4d05f2b3e4abc7b989f9fb28ae30c453035c')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build  --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/pkgdu" "$pkgdir/usr/bin/pkgdu"

  install -Dm644 "README.adoc" "$pkgdir/usr/share/doc/${pkgname}/README.adoc"
}
