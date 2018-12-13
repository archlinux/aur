# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=tldr-git
pkgver=1.3.0+15.g9b23d26854
pkgrel=1
pkgdesc="C++ command line client for tldr"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/tldr-pages/tldr-cpp-client"
license=('MIT')
depends=('curl')
makedepends=('git' 'make' 'clang' 'curl' 'libzip')
source=("git+$url")
md5sums=('SKIP')
provides=('tldr')

pkgver() {
  cd "$(basename $url)"
  git describe --long --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  cd "$srcdir/$(basename $url)"
  make
}

package() {
  cd "$srcdir/$(basename $url)"
  install -Dm755 tldr "$pkgdir/usr/bin/tldr"
}
