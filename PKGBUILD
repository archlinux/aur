# Maintainer: devvick <root@devvick.eu>

pkgname=zeronsd
pkgver=0.4.2
pkgrel=1
pkgdesc="Unicast DNS resolver for ZeroTier networks"
url="https://github.com/zerotier/zeronsd"
license=("BSD-3-Clause")
arch=("any")
depends=("zerotier-one")
makedepends=("cargo" "git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c9872dd0454f7edacbe1a136323dfc8fc4e49ca706e401d5f06d4c0263b46715')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --locked --lib
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
