# Maintainer: Adrian Petrescu <adrian@apetre.sc>

pkgname=cf-tool
pkgver=0.8.2
pkgrel=1
pkgdesc="A command-line tool for Codeforces contests"
arch=('x86_64')
url="https://github.com/xalanq/cf-tool"
license=('MIT')
depends=('glibc')
makedepends=('go-pie' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xalanq/cf-tool/archive/v$pkgver.tar.gz")
sha512sums=('19e616fd702928323adfffb840521f6d0828278c79d6ee9fe3af1f666f754545c2865bb10afc0487c03d5c87d0ff7b23c3f9a7d68085ede6bfc8b780da8d439a')

prepare() {
  cd $pkgname-$pkgver

  mkdir -p .gopath/src/github.com/xalanq
  ln -sf "$PWD" .gopath/src/github.com/xalanq/cf-tool
  export GOPATH="$PWD/.gopath"

  go get github.com/xalanq/cf-tool
}

build() {
  cd $pkgname-$pkgver/.gopath/src/github.com/xalanq/cf-tool

  go build -o cf -trimpath -ldflags "-s -w" cf.go
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 cf "$pkgdir"/usr/bin/cf
}
