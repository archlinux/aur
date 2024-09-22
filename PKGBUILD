# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

pkgname=inferno
pkgver=0.11.21
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
sha256sums=('8650bcb44715ecf83b00d36ed0e28e8b6c1f11d9de8e25a54554d72c0d67dc87')

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

  install -Dm644 "CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
