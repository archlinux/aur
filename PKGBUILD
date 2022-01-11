# Maintainer: Rui Marques <aur@ruimarques.xyz>

pkgname=inferno
pkgver=0.10.9
pkgrel=2
pkgdesc="A Rust port of FlameGraph"
arch=('x86_64')
url="https://github.com/jonhoo/inferno"
license=('CDDL')
depends=('gcc-libs')
makedepends=('rust')
provides=(
    'inferno-collapse-perf'
    'inferno-collapse-dtrace'
    'inferno-collapse-guess'
    'inferno-flamegraph'
    'inferno-diff-folded'
)
conflicts=('inferno-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('be7339159f6d889a89a3c91746487375b08fdfcb99196e511c2e8d4077687ff6')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/inferno-collapse-perf" "${pkgdir}/usr/bin/inferno-collapse-perf"
  install -Dm755 "target/release/inferno-collapse-dtrace" "${pkgdir}/usr/bin/inferno-collapse-dtrace"
  install -Dm755 "target/release/inferno-collapse-guess" "${pkgdir}/usr/bin/inferno-collapse-guess"
  install -Dm755 "target/release/inferno-flamegraph" "${pkgdir}/usr/bin/inferno-flamegraph"
  install -Dm755 "target/release/inferno-diff-folded" "${pkgdir}/usr/bin/inferno-diff-folded"
}
