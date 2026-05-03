# Maintainer: Marvin Sarreal Villanueva <marvin@orin.work>
pkgname=qorx
pkgver=1.0.4_a.0
pkgrel=1
_cratever=1.0.4-a.0
pkgdesc="Qorx Community Edition source CLI for local context-resolution research"
arch=('x86_64' 'aarch64')
url="https://github.com/bbrainfuckk/qorx"
license=('AGPL-3.0-only')
makedepends=('cargo')
source=("${pkgname}-${_cratever}.tar.gz::https://crates.io/api/v1/crates/${pkgname}/${_cratever}/download")
sha256sums=('a0f2e317eca3980346348ef7fcdbb7b7982d76785e766d586cf646b3c1f14bde')

build() {
  cd "${srcdir}/${pkgname}-${_cratever}"
  cargo build --release --locked
}

check() {
  cd "${srcdir}/${pkgname}-${_cratever}"
  cargo test --locked
}

package() {
  cd "${srcdir}/${pkgname}-${_cratever}"
  install -Dm755 target/release/qorx "${pkgdir}/usr/bin/qorx"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 docs/COMMANDS.md "${pkgdir}/usr/share/doc/${pkgname}/COMMANDS.md"
}
