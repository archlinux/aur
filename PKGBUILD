# Maintainer: Christopher Auer <christopher AT auer DOT team>

pkgname=eilmeldung
pkgver=1.7.1
pkgrel=1
pkgdesc="a TUI RSS reader based on the news-flash library"
arch=('x86_64')
url="https://github.com/christo-auer/eilmeldung"
license=('GPL-3.0-or-later')
depends=('libxml2' 'openssl' 'sqlite3' 'libsixel')  
conflicts=('eilmeldung-git' 'eilmeldung-bin' )
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b4d19c0d4eb3e3f44a04e4cb0e54f714f391f7a2bd85ea9a5284b04108e9a134')
arch=('x86_64')
options=('!lto')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${pkgname}-${pkgver}"
  export AWS_LC_SYS_NO_JITTER_ENTROPY=1
  cargo build --frozen --release 
}

check() {
  cd "${pkgname}-${pkgver}"
  export AWS_LC_SYS_NO_JITTER_ENTROPY=1
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/eilmeldung -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:

