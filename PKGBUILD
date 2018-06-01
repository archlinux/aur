# Maintainer: Martynas Mickevičius <self@2m.lt>
pkgname=jabba
pkgver=0.10.1
pkgrel=1
pkgdesc="Java Version Manager."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/shyiko/jabba"
license=('ApacheV2')
options=('!strip' '!emptydirs')
makedepends=('git' 'go' 'glide')
source=("https://github.com/shyiko/jabba/archive/${pkgver}.tar.gz")
sha256sums=('059d5f14a23eba8f3cedf047c99489173fe52fe9bda6484e4000afc9cb7dfb0a')

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

