# Maintainer: Your Name <your.email@example.com>

pkgname=node-cleaner
pkgver=0.1.4
pkgrel=1
pkgdesc="A tool for cleaning and managing node_modules directories"
arch=('x86_64')
url="https://github.com/Breinss/rust-node-modules-cleaner"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Breinss/rust-node-modules-cleaner/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "rust-node-modules-cleaner-main"
  cargo fetch --locked
}

build() {
  cd "rust-node-modules-cleaner-main"
  cargo build --release --locked
}

check() {
  cd "rust-node-modules-cleaner-main"
  cargo test --release --locked
}

package() {
  cd "rust-node-modules-cleaner-main"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Optional: install documentation
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  
  # If you have a license file, uncomment and adjust the following:
   install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
