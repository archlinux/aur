# Maintainer: Sami Ahmed <SamiAhmed7777@users.noreply.github.com>
# Contributor: Sami Ahmed <SamiAhmed7777@users.noreply.github.com>

pkgname=tri7d-bin
pkgver=7.0.0
pkgrel=1
pkgdesc="Cryptographic Triangles (TRI) lightweight Rust daemon (tri7) — PoS staking, Tor + I2P, built-in explorer"
arch=('x86_64')
url="https://github.com/SamiAhmed7777/tri7"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git')
provides=('tri7d')
conflicts=('tri7d')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SamiAhmed7777/tri7/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3c1b1845d2b11e76a3a30624ceab3694f23c465cd7489944840e0a7604270a83')

# NOTE: this PKGBUILD builds from the tagged source of the tri7 repo.
# While the tri7 repo is PRIVATE the source URL 404s — flip the repo
# public for the package to be installable.
# The workflow regenerates sha256sums from the real tarball each release.

build() {
  cd "${srcdir}/tri7-${pkgver}"
  cargo build --release --bin tri7d
}

check() {
  cd "${srcdir}/tri7-${pkgver}"
  cargo test --release --lib
}

package() {
  cd "${srcdir}/tri7-${pkgver}"
  install -Dm755 target/release/tri7d "${pkgdir}/usr/bin/tri7d"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/tri7d/README.md"
}
