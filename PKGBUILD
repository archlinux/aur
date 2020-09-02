# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=asroute
pkgver=0.1.0
pkgrel=1
pkgdesc="Interpret traceroute output to show names of ASN traversed"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/stevenpack/asroute"
license=('MIT')
makedepends=(
  'cargo'
)
source=(
  "git+https://github.com/stevenpack/asroute"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/asroute"
  git checkout v${pkgver}
  git submodule update --init --recursive
}

package() {
  cd "${srcdir}/asroute"

  cargo build --release --verbose

  install -Dm755 "target/release/asroute" "$pkgdir/usr/bin/asroute"
}
