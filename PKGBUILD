# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=battered
pkgver=0.9.0
pkgrel=1
pkgdesc="Regularly polls battery levels and reacts to crossing configurable thresholds."
arch=('x86_64')
url="https://github.com/t4k1t/battered"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/t4k1t/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('2ac831189bbaabba576ba40eee2495e5c6d55e9d89008b7f0f98d3a0dca8bcc3bd51680e06552b27dd161104200acec42ea9ca5a9c8fbc8d5e9aa2af60fbfd65')
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
