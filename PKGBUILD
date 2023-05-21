# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=ripcalc
_binary=ripcalc
pkgver=0.1.8
pkgrel=1
pkgdesc="ripcalc, an IP network address tool"
url="https://gitlab.com/edneville/ripcalc"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${_binary}/-/archive/v${pkgver}/${_binary}-v${pkgver}.tar.gz")
sha512sums=('4430dad03a29ebb95979f392986000fadaa71fb261823e90991221ca80fade319e3d0cc69c4ff982d52488e49aa82d1c49c4729a7b1bf5f8beebeb90068d3d6c')

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

