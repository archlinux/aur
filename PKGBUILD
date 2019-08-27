# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-crev
pkgver=0.9.0
pkgrel=1
pkgdesc="Scalable, social, Code REView and recommendation system that we desperately need"
url="https://github.com/dpc/crev"
depends=('openssl' 'curl')
makedepends=('cargo' 'clang')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('MPL' 'Apache' 'MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dpc/crev/archive/v${pkgver}.tar.gz")
sha512sums=('66d9f17378ef4f64d70bf3924eb3e3f3a307bebdb5d8c99f18654b25ca05f2f7f285209eef10443aba4a8da2716bafccd2b6f153670db7c704fa33e8aa543830')

build() {
  cd "${pkgname}-${pkgver}/cargo-crev"
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
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
