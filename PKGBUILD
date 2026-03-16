# Maintainer: Christopher Auer <christopher AT auer DOT team>

pkgname=eilmeldung
pkgver=1.2.3
pkgrel=2
pkgdesc="a TUI RSS reader based on the news-flash library"
arch=('x86_64')
url="https://github.com/christo-auer/eilmeldung"
license=('GPL-3.0-or-later')
depends=('libxml2' 'openssl' 'sqlite3' 'libsixel')  
conflicts=('eilmeldung-git' 'eilmeldung-bin' )
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2890af8656acf7996b0c312be7063495d4ddfcdc997e63e218df73401eddae55')
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

