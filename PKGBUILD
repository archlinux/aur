# Maintainer: Damian Poddebniak <poddebniak at fh-muenster dot de>
pkgname=hexlify-git
pkgver=r17.b9f8998
pkgrel=1
pkgdesc="Python's {un,}hexlify for the command-line."
arch=('x86_64' 'i686' )
url="https://github.com/duesee/hexlify"
license=('AGPLv3')
makedepends=('git' 'rust' 'cargo')
provides=('hexlify' 'unhexlify')
source=('git+https://github.com/duesee/hexlify')
md5sums=('SKIP')

build() {
  cd "$srcdir/hexlify"
  cargo build --release
}

package() {
  cd "$srcdir/hexlify"
  mkdir -p $pkgdir/usr/bin
  install -o root -g root -m 755 target/release/hexlify $pkgdir/usr/bin
  ln -s /usr/bin/hexlify $pkgdir/usr/bin/unhexlify
}

pkgver() {
  cd "$srcdir/hexlify"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
