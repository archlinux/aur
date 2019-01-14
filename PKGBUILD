# Maintainer: Árni Dagur <arnidg@protonmail.ch>

pkgname='xcp'
pkgver='0.1.1_alpha.3'
_tagname=${pkgver//_/-}
pkgrel=1
pkgdesc="An exctended 'cp', written in Rust"
arch=('x86_64')
url='https://github.com/tarka/xcp'
license=('GPL-3.0')
depends=('gcc-libs')
makedepends=('git' 'rust' 'cargo')
source=("$pkgname-$_tagname::https://github.com/tarka/xcp/archive/$pkgver$_tagname.tar.gz")
sha512sums=('fa82c42ae7aa4d62bfe1a27c1b23f9b3e81fb87805112c71c06e6aca731852734402c6241b687797b46e2908ec90e8c08ef1fb2092c2424c410931f6a3c1016c')

build() {
  cd $pkgname-$_tagname
  cargo build --release --locked
}

check() {
  cd $pkgname-$_tagname
  cargo test --release --locked
}

package() {
  cd $pkgname-$_tagname
  install -Dt "$pkgdir"/usr/bin target/release/xcp
}
