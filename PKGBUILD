# Maintainer: devvick <root@devvick.eu>

pkgname=zeronsd
pkgver=0.4.3
pkgrel=1
pkgdesc="Unicast DNS resolver for ZeroTier networks"
url="https://github.com/zerotier/zeronsd"
license=("BSD-3-Clause")
arch=("any")
depends=("zerotier-one")
makedepends=("cargo" "git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cc7e657aa29cb95d481e89b825fdd72d77cac42868de5c62866e86c0c1202038')

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
