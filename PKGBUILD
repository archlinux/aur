# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=battered
pkgver=0.9.1
pkgrel=1
pkgdesc="Regularly polls battery levels and reacts to crossing configurable thresholds."
arch=('x86_64')
url="https://github.com/t4k1t/battered"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/t4k1t/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('fb8a0472417c76656584389177e09b80c54745e8b2b875bee66c2b7668985e6ca4f7d9e05fc729d788ad42b10a7bae91ab93d3f87ef83f672da40fd44fc0d283')
options=(!lto)

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/battered" "${pkgdir}/usr/bin/battered"

  # Documentation
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "docs/man/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
  install -Dm644 "docs/man/${pkgname}.5.gz" "${pkgdir}/usr/share/man/man5/${pkgname}.5.gz"

  # systemd unit
  install -Dm644 "examples/battered.service" "${pkgdir}/usr/lib/systemd/user/battered.service"
}
