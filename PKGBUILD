# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=speedtest-zpeters
_pkgver=2.0.0-a
pkgver="${_pkgver//-}"
pkgrel=1
pkgdesc='Command line client for speedtest.net written in Go'
url=https://github.com/zpeters/speedtest
arch=('x86_64')
license=('GPL3')
depends=('glibc')
makedepends=('dep' 'git' 'go-pie')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha512sums=('cd875309947c360e1ec54c6bac7bb52c09b525800a185343299cbcc0d6ee13ded6664551a5a647a19a69019c4a6d8a3ecb356dca535bac43eb99348e506a6b33')

prepare() {
  mkdir -p go/src/github.com/zpeters
  ln -fnrs speedtest-$_pkgver go/src/${url#*//}
}

build() {
  cd go/src/${url#*//}
  export GOPATH="$srcdir/go"
  dep ensure
  make VERSION=$_pkgver
}

#check() {
#  cd go/src/${url#*//}
#  export GOPATH="$srcdir/go"
#  go test ./...
#}

package() {
  cd speedtest-$_pkgver
  install -D bin/speedtest-$_pkgver "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
