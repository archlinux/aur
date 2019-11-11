# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-fuzz
pkgver=0.5.4
pkgrel=1
pkgdesc="Command line helpers for fuzzing "
url="https://github.com/rust-fuzz/cargo-fuzz"
depends=('cargo' 'gcc-libs')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rust-fuzz/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('de5f6aabc7d80d7b4ad08b563d19128c72951d7ada32c815056b55c5c5903423b665124f496fc8948f40700312e29e0b142cedeb1d4f083c5c3d693d10360f17')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
