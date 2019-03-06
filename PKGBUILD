#Maintainer: Mikhail Rudenko <mike.rudenko@gmail.com>
_pkgname=bingo
pkgname=$_pkgname-git
pkgver=r885.43cf020
pkgrel=2
pkgdesc='A Go language server that speaks Language Server Protocol, largely inspired by go-langserver (git version).'
arch=('x86_64')
url="https://github.com/saibing/bingo"
license=('MIT')
makedepends=('go' 'git')
source=(git+https://github.com/saibing/bingo)
md5sums=('SKIP')

provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $_pkgname .
}

package() {
  cd $_pkgname
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
