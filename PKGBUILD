# Maintainer: Rui Marques <aur@ruimarques.xyz>

pkgname=inferno
pkgver=0.11.14
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
sha256sums=('f3f8518449581b8de182407e016385a0415aff84105a5ff966ca6adc981b4db3')

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
