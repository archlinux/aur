# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
pkgname=tut
pkgver=0.0.30
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys'
arch=('any')
url="https://github.com/RasmusLindroth/$pkgname"
license=('MIT')
makedepends=('go')
source=("https://github.com/RasmusLindroth/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('558d77e97c33ee538030080a16bd6a1521a82d78c03fc11cd52977cb6263223c')

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
