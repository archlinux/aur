# Maintainer: dllud <dllud riseup net>

pkgname=ckb-cli
pkgver=2.0.0
pkgrel=1
pkgdesc='Nervos CKB (Common Knowledge Base) command line tool'
arch=('i686' 'x86_64')
url='https://github.com/nervosnetwork/ckb-cli'
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nervosnetwork/ckb-cli/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('cc3e9285addc46b59a988e8e441419b2ee345d7a276f59af0dad9e784551d1ae50e64c25589ebd36deb2ea01ffec20a401108a883c1d099ba754ca84841be785')
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
