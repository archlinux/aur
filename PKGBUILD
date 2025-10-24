# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli
pkgver=1.16.0
pkgrel=1
pkgdesc='Nervos CKB (Common Knowledge Base) command line tool'
arch=('i686' 'x86_64')
url='https://github.com/nervosnetwork/ckb-cli'
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nervosnetwork/ckb-cli/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('db00713f6eb8e332573051c20604c1bc06842beae0026ec334ddcc9519d9af5d84220a963f785ffd7486b65f7f53aff0de2e6d324106e3630fc8ef9ac6719ab3')
options=(!lto)

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" target/release/ckb-cli
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
