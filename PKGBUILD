# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=tldr-git
pkgver=r39.fb7be27
pkgrel=1
pkgdesc="C++ command line client for tldr"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/tldr-pages/tldr-cpp-client"
license=('MIT')
depends=('curl')
makedepends=('git' 'make' 'clang' 'curl')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$(basename $url)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$(basename $url)/src"
  make
}

package() {
  cd "$srcdir/$(basename $url)/src"
  install -Dm755 tldr "$pkgdir/usr/bin/tldr"
}
