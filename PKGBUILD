# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=ripcalc
_binary=ripcalc
pkgver=0.1.3
pkgrel=0
pkgdesc="ripcalc, an IP network address toool"
url="https://gitlab.com/edneville/ripcalc"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${_binary}/-/archive/v${pkgver}/${_binary}-v${pkgver}.tar.gz")
sha512sums=('f399950d1ba230f1637d7f1a406c8437df199a2ddb10a4d4d3e97dff58eeebfe139266228f67b064dd4bfead2f0a12f5ef76f041c7250b84a59b98c1a9f64ed9')

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

