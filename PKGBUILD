# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Martynas Mickevičius <self@2m.lt>

pkgname=jabba
pkgver=0.11.2
pkgrel=1
pkgdesc="Java Version Manager."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/shyiko/jabba"
license=('Apache')
options=('!strip' '!emptydirs')
makedepends=('git' 'go' 'glide')
depends=('glibc')
source=("https://github.com/shyiko/jabba/archive/${pkgver}.tar.gz")
sha256sums=('33874c81387f03fe1a27c64cb6fb585a458c1a2c1548b4b86694da5f81164355')

build() {
  export GOPATH=$srcdir/gopath
  mkdir $GOPATH

  mkdir -p "$GOPATH/src/github.com/shyiko"
  mv "$srcdir/$pkgname-$pkgver" "$GOPATH/src/github.com/shyiko/jabba"
  cd "$GOPATH/src/github.com/shyiko/jabba"

  make fetch
  make VERSION=$pkgver build
}

package() {
  install -D -m755 "$srcdir/gopath/src/github.com/shyiko/jabba/jabba" "$pkgdir/usr/bin/jabba"
}

