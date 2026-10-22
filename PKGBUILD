# Maintainer: Christopher Auer <christopher AT auer DOT team>

pkgname=eilmeldung
pkgver=1.9.1
pkgrel=1
pkgdesc="a TUI RSS reader based on the news-flash library"
arch=('x86_64')
url="https://github.com/christo-auer/eilmeldung"
license=('GPL-3.0-or-later')
conflicts=('eilmeldung-git' 'eilmeldung-bin' )
depends=( )
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('61ad045e3d829339f5e7ab5d071e6fac54a3ffe200042c98de8254bea004820f')
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

