#Maintainer: Mikhail Rudenko <mike.rudenko@gmail.com>
pkgname=bingo
pkgver=1.1.0
pkgrel=1
pkgdesc='A Go language server that speaks Language Server Protocol, largely inspired by go-langserver.'
arch=('x86_64')
url="https://github.com/saibing/bingo"
license=('MIT')
makedepends=('go' 'git')
source=(https://github.com/saibing/bingo/archive/v1.1.0.tar.gz)
sha256sums=('4aa7fedca55c636b014b8127ae1c5277521b8a27acbc3eedc2eef7e92bb1273f')
provides=($pkgname)
conflicts=($pkgname-git)

build() {
  cd $pkgname-$pkgver
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
