# Maintainer: Christopher Auer <christopher AT auer DOT team>

pkgname=eilmeldung
pkgver=0.9.3
pkgrel=1
pkgdesc="a TUI RSS reader based on the news-flash library"
arch=('x86_64')
url="https://github.com/christo-auer/eilmeldung"
license=('GPL-3.0-or-later')
depends=('libxml2' 'openssl' 'sqlite3' 'libsixel')  
conflicts=('eilmeldung-git' 'eilmeldung-bin' )
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5334aea574e4df38c197340d5106cef2f1e5af3d977a232aae62db9eb21f9b8f')
arch=('x86_64')
options=('!lto')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release 
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/eilmeldung -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:

