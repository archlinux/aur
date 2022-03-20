# Maintainer: Rui Marques <aur@ruimarques.xyz>

pkgname=inferno
pkgver=0.11.1
pkgrel=1
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
sha256sums=('bc3639aff0a1b27184f1b86eac0c5462db01d31c25c26f46d3f946002fba4192')

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
