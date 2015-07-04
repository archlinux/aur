# Maintainer: Jonhnny Weslley <jw@jonhnnyweslley.net>
pkgname=localdns
pkgver=0.1.0
pkgrel=1
pkgdesc="A DNS for local development"
arch=('i686' 'x86_64')
url="https://github.com/jweslley/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!strip' '!emptydirs')
install=$pkgname.install
source=("https://github.com/jweslley/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('e040cd45d1ca14d554e1be1d0a39d2ed')

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"
  export GOBIN="."

  go get ./...
  go build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ext/linux/localdns.service "$pkgdir"/usr/lib/systemd/system/localdns.service
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
