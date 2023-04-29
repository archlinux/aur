# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=ripcalc
_binary=ripcalc
pkgver=0.1.7
pkgrel=1
pkgdesc="ripcalc, an IP network address tool"
url="https://gitlab.com/edneville/ripcalc"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${_binary}/-/archive/v${pkgver}/${_binary}-v${pkgver}.tar.gz")
sha512sums=('5572be1b16fef815c41141dd0dddf68b73e33848f6dcac43f5eab938efb3b1d60fc0cf3d2ea3c9ea271d5861081214fffda69eaac745ae56e1db453c65e5186a')

prepare() {
  cd ripcalc-v${pkgver}
  cargo fetch --target x86_64-unknown-linux-gnu
}

build() {
  cd ripcalc-v${pkgver}
  cargo build --release --frozen --all-targets
}

check() {
  cd ripcalc-v${pkgver}
  # test_expand* fails; needs nightly rust
  cargo test --release --frozen || :
}

package() {
  cd ripcalc-v${pkgver}
  install -Dt "$pkgdir/usr/bin" -m0755 target/release/ripcalc
}

