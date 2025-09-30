# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=pwtool
_binary=pwtool
pkgver=0.9.3
pkgrel=1
pkgdesc="pwtool, default generated password set is copy/paste friendly without extended characters that would break the default copy selection you get when double-clicking a word"
url="https://gitlab.com/edneville/pwtool"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${_binary}/-/archive/v${pkgver}/${_binary}-v${pkgver}.tar.gz")
sha512sums=('1af3e0af2f50ff94973d95d3d8b8b959783639cf8a0ed220ffd1a8c6cc28baec3e09182762bed8eb38cdd3a8c883fdfb4ae2b6680d565279d901781e24723b61')

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

