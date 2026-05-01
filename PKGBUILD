# Maintainer: Marvin Sarreal Villanueva <marvin@orin.work>
pkgname=qorx
pkgver=1.0.2
pkgrel=1
pkgdesc="Qorx language and runtime for local context resolution"
arch=('x86_64' 'aarch64')
url="https://github.com/bbrainfuckk/qorx"
license=('AGPL-3.0-only')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha256sums=('d3d2dae84ba985a1d694c2e9425115ac1c6495e3a716ce9cfe774728ebb00f38')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/qorx "${pkgdir}/usr/bin/qorx"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 docs/COMMANDS.md "${pkgdir}/usr/share/doc/${pkgname}/COMMANDS.md"
}
