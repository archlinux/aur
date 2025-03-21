# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=pwtool
_binary=pwtool
pkgver=0.6.1
pkgrel=2
pkgdesc="pwtool, default generated password set is copy/paste friendly without extended characters that would break the default copy selection you get when double-clicking a word"
url="https://gitlab.com/edneville/pwtool"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${_binary}/-/archive/v${pkgver}/${_binary}-v${pkgver}.tar.gz")
sha512sums=('2831f3ffa9ab54a59779a96dc249d9b7537bf0048c8557d0d62e991d7939927336319f210bcb0b0c62b804173000c5088641820e5b51aefd91618f4066ddf71f')

prepare() {
  cd ${_binary}-v${pkgver}
  cargo fetch --target x86_64-unknown-linux-gnu
}

build() {
  cd ${_binary}-v${pkgver}
  cargo build --release --frozen --all-targets
}

check() {
  cd ${_binary}-v${pkgver}
  # test_expand* fails; needs nightly rust
  cargo test --release --frozen || :
}

package() {
  cd ${_binary}-v${pkgver}
  install -Dt "$pkgdir/usr/bin" -m0755 target/release/${_binary}
#  install -Dt "$pkgdir/usr/share/man/man1" -m0644 ${_binary}.1
}

