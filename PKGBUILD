# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=mkr
pkgver=0.35.1
pkgrel=2
pkgdesc="Command Line Tool for Mackerel"
arch=('i686' 'x86_64')
url="https://github.com/mackerelio/mkr"
license=('APACHE')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mackerelio/mkr/archive/v${pkgver}.tar.gz"
        "https://github.com/mackerelio/mkr/commit/48ed634eb7df7d3f89a8b6ea373caa051393bbe6.patch"
        "https://github.com/mackerelio/mkr/commit/7f18436b3f94d78560eb1abe6f672715edc56d70.patch")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # See https://github.com/mackerelio/mkr/pull/193 in detail about this patch
  patch -p1 < ../48ed634eb7df7d3f89a8b6ea373caa051393bbe6.patch
  # See https://github.com/mackerelio/mkr/pull/194 in ditto
  patch -p1 < ../7f18436b3f94d78560eb1abe6f672715edc56d70.patch

  export GOPATH="$srcdir/build"
  export PATH="$PATH:$GOPATH/bin"
  make build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOPATH="$srcdir/build"
  export PATH="$PATH:$GOPATH/bin"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 mkr "$pkgdir/usr/bin/mkr"
}

sha512sums=('dc4784d73db373399e27b74660132a70a867906d89c19471b76b335b8014a599260ea490b225a060570b054cd7f9a213e4fb87c13dd9fe94b9bca0797054e589'
            'e19fa82d12123330912ca6c01cafb4286137089cc2a808104b9cb95b74b40bce1672c8677c3d9dc2777e58aa17eaee39e17cb1524cc6353d400df8b304cd9b32'
            '0d0ed3b1087214eff97b330010412dcaa18dc4a7285a40d1e52e241ca899f1dc7b4bf190f6c18eafa0b6453ac96e52e43c1b80a90aa594c4ab976d8478bb1158')

# vim: set et sw=2 sts=2:
