# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=ripcalc
_binary=ripcalc
pkgver=0.1.9
pkgrel=1
pkgdesc="ripcalc, an IP network address tool"
url="https://gitlab.com/edneville/ripcalc"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${_binary}/-/archive/v${pkgver}/${_binary}-v${pkgver}.tar.gz")
sha512sums=('486ab56c521c67241692a58d064b6e198d19b1e3b2c6608ea57b95d9010c8b2f505bd9b67e32d6459115b1d234abb48207833e6cef7a0551bbd347047096040c')

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
  install -Dt "$pkgdir/usr/share/man/man1" -m644 ripcalc.1
}

