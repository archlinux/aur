# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=flapc
pkgver=1.4.0
pkgrel=1
pkgdesc='Experimental compiler for the Flap programming language'
arch=(x86_64)
url='https://github.com/xyproto/flapc'
license=(BSD3)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('a68e1dda1d096bd9ab9ea3724c84ad557cebe1a9a57a622bedc0ee804348bf9207daaf64b1fb5b89b2e51a6597afd44c0df042e5f2460d748d633d48f2ff3ab1')

build() {
  cd $pkgname
  export GOEXPERIMENT=greenteagc
  go build -v -mod=vendor -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
