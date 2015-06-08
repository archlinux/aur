# Maintainer: Jonne Haß <me@mrzyx.de>

pkgname=dename
pkgver=r31.a97771b
pkgrel=1
pkgdesc="NameCoin-style names using consensus instead of proof of work "
arch=('x86_64' 'i686')
url="https://github.com/andres-erbsen/dename/"
license=('Apache')
depends=('bash')
makedepends=('git' 'go' 'mercurial')
options=('!strip' '!emptydirs')
source=('git://github.com/andres-erbsen/dename.git')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
  mkdir -p go
  export GOPATH="$srcdir/go"
  go get code.google.com/p/gcfg
  go get github.com/andres-erbsen/dename/client
}

build() {
 _srcdir="$srcdir/$pkgname"

 cd "$_srcdir/dnmgr/dnmgr"
 go build -o dnmgr main.go

 cd "$_srcdir/dnmlookup"
 go build -o dnmlookup main.go
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 dnmgr/dnmgr/dnmgr "$pkgdir/usr/bin/dnmgr"
  install -Dm755 dnmlookup/dnmlookup "$pkgdir/usr/bin/dnmlookup"
  install -Dm755 utils/dnget "$pkgdir/usr/bin/dnget"
  install -Dm755 utils/dngpg "$pkgdir/usr/bin/dngpg"
}

# vim:set ts=2 sw=2 et:
sha256sums=('SKIP')
