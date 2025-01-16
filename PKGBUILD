# Maintainer: a821 at (nospam) mail de
# Contributor: mwberry <matt@comp.uter.science>

pkgname=re2c-git
pkgver=4.0.2.r19.ggb8406137d
pkgrel=1
pkgdesc='Lexer generator for C, C++, D, Go, Haskell, Java, JS, OCaml, Python, Rust, V and Zig'
arch=(x86_64)
url='https://re2c.org'
license=('custom:PublicDomain')
depends=('gcc-libs')
makedepends=('git' 'python')
source=(git+https://github.com/skvadrik/re2c)
sha1sums=('SKIP')
provides=('re2c')
conflicts=('re2c')

pkgver() {
  cd "re2c"
  git describe --long --tags | sed 's/-/.r/;s/-/.g/'
}

build() {
  cd "re2c"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  make -C "re2c" check
}

package() {
  cd "re2c"
  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

