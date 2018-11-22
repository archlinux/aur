# Maintainer: Martynas Mickevičius <self@2m.lt>
pkgname=jabba
pkgver=0.11.0
pkgrel=1
pkgdesc="Java Version Manager."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/shyiko/jabba"
license=('Apache')
options=('!strip' '!emptydirs')
makedepends=('git' 'go' 'glide')
depends=('glibc')
source=("https://github.com/shyiko/jabba/archive/${pkgver}.tar.gz")
sha256sums=('1eee1ac5a8bf74918b95e933f91037bffa320c28da2013d876888fcf19bc94f8')

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

