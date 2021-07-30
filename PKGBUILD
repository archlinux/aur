# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=netrs
_binary=netr
pkgver=0.1.6
pkgrel=0
pkgdesc="netr simple console network traffic graph"
url="https://gitlab.com/edneville/netrs"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('dfd458e780f3e0fcc5ef5c9057e5ed5c53f7084deb159e8afc122c258fa3a10dd4a68ceef0e44117075857d28f7a4e7ea04051d1b94d1cefd3b1ebd1583f9d61')

prepare() {
  cd ${pkgname}-v${pkgver}
  cargo fetch
}

build() {
  cd ${pkgname}-v${pkgver}
  cargo build --release --frozen --all-targets
}

check() {
  cd ${pkgname}-v${pkgver}
  cargo test --release --frozen
}

package() {
  cd ${pkgname}-v${pkgver}
  install -Dt "$pkgdir/usr/bin" -m4755 "target/release/${_binary}"
  install -Dt "$pkgdir/usr/share/doc/${_pkgname}" -m644 README.md
  install -Dt "$pkgdir/usr/share/man/man1" -m644 "${_binary}.1"
}

