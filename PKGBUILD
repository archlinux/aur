# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-debstatus
pkgver=0.5.1
pkgrel=1
pkgdesc="cargo-tree for debian packaging"
url="https://github.com/kpcyrd/cargo-debstatus"
depends=(
  'curl'
  'gcc-libs'
  'glibc'
  'openssl'
)
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL-3.0-or-later')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kpcyrd/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('990b6e203abd683fa38f3ea8ef4a6d288969700d579124b45102c8cb784f4db76b8111a641700357aef4a8729850824d44b14852b45781f8dee4c91d2645bb0b')

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
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
