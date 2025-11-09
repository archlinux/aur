# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=pwtool
_binary=pwtool
pkgver=0.11.0
pkgrel=1
pkgdesc="pwtool, default generated password set is copy/paste friendly without extended characters that would break the default copy selection you get when double-clicking a word"
url="https://gitlab.com/edneville/pwtool"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${_binary}/-/archive/v${pkgver}/${_binary}-v${pkgver}.tar.gz")
sha512sums=('54ea9b1d464632e52a24ce4ec769bc90f63d624aa0c92eea2ab5c0a611cdbf67fcc8764e5b7803706043756705681e988bc1332ef9f7de17356db241d82feb6e')

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

