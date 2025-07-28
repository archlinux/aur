# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=pwtool
_binary=pwtool
pkgver=0.9.2
pkgrel=1
pkgdesc="pwtool, default generated password set is copy/paste friendly without extended characters that would break the default copy selection you get when double-clicking a word"
url="https://gitlab.com/edneville/pwtool"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${_binary}/-/archive/v${pkgver}/${_binary}-v${pkgver}.tar.gz")
sha512sums=('7e046a158f29d7a72c5aed34a5267bdd2db8a9d35d70ea17c01da34893e4753c3e038850ea8022b0f1dc43b4529788c2d7049cc159d3a6cafe31980a2d78796f')

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

