# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=battered
pkgver=0.8.2
pkgrel=1
pkgdesc="Regularly polls battery levels and reacts to crossing configurable thresholds."
arch=('x86_64')
url="https://github.com/t4k1t/battered"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/t4k1t/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('5f2dcfb83f1e8e6d458a69c573122b373fa809faf4c0571f2744374c185fc9dda567b46b3894b950ea8aeb4158695b5f94d2e69ab7ab7faafe3f0dd323e93905')
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
