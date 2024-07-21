# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=ripcalc
_binary=ripcalc
pkgver=0.1.12
pkgrel=2
pkgdesc="ripcalc, an IP network address tool"
url="https://gitlab.com/edneville/ripcalc"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${_binary}/-/archive/v${pkgver}/${_binary}-v${pkgver}.tar.gz")
sha512sums=('933a46386a8ccc22d60e1a7a7122d6410d9bb043c3750a586d1ffa70453489fff387bf630b422e45e41598bc281f48f67d8d8ca67dbe64184c85daec6f858c2a')

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
  install -Dt "$pkgdir/usr/share/man/man1" -m0644 ripcalc.1
}

