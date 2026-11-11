# Maintainer: Christopher Auer <christopher AT auer DOT team>

pkgname=eilmeldung
pkgver=1.10.1
pkgrel=1
pkgdesc="a TUI RSS reader based on the news-flash library"
arch=('x86_64')
url="https://github.com/christo-auer/eilmeldung"
license=('GPL-3.0-or-later')
conflicts=('eilmeldung-git' 'eilmeldung-bin' )
depends=( )
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('aa62a74eabb7f8cecf38faac1485ea6a712dc4b618d97c92ef8571703d74f0ee')
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

