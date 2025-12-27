# Maintainer: Christopher Auer <christopher AT auer DOT team>

pkgname=eilmeldung
pkgver=r283.01c760a
pkgrel=1
pkgdesc="a TUI RSS reader based on the news-flash library"
arch=('x86_64')
url="https://github.com/christo-auer/eilmeldung"
license=('GPL-3.0-or-later')
depends=('libxml2' 'openssl' 'sqlite3' 'libsixel')  
conflicts=( 'eilmeldung' )
makedepends=('cargo' 'clang' 'git')
source=("git+$url.git")
sha256sums=('SKIP')
arch=('x86_64')
options=('!lto')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --frozen --release 
}

check() {
  cd "$srcdir/$pkgname"
  cargo test --frozen
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/eilmeldung -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:

