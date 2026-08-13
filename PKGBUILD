pkgname=jetdb-cli
pkgver=0.3.2
pkgrel=1
pkgdesc="CLI tool for reading Microsoft Access (.mdb/.accdb) files"
arch=('x86_64' 'aarch64')
url="https://github.com/dominion525/jetdb"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('564fae87fbfa550c70e0f9e1ae8ed9861b07df64436de1162a7e9eb615e4effe')

prepare() {
  cd "jetdb-${pkgver}"
  cargo fetch --locked
}

build() {
  cd "jetdb-${pkgver}"
  cargo build --release --locked --offline -p jetdb-cli
}

check() {
  cd "jetdb-${pkgver}"
  cargo test --release --locked --offline -p jetdb-cli
}

package() {
  cd "jetdb-${pkgver}"
  install -Dm755 target/release/jetdb "${pkgdir}/usr/bin/jetdb"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
