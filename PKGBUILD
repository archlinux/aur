pkgname=jetdb-cli
pkgver=0.4.0
pkgrel=1
pkgdesc="CLI tool for reading Microsoft Access (.mdb/.accdb) files"
arch=('x86_64' 'aarch64')
url="https://github.com/dominion525/jetdb"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('de689978f095073c20c30316584aeef542fc25841f1e3d0e8fef421bc4cee6c0')

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
