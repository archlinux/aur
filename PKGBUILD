# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=interfaces
pkgver=1.3.1
pkgrel=1
pkgdesc='List all network interfaces'
arch=(x86_64)
url='https://github.com/xyproto/interfaces'
license=(BSD)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('c419b2b7ff307b54e8b0f65117baf10874c60d9864e80ffce36a09648427e9d65497c63f44e6371f917e62ef6ae0da141966074f0b69db73447bfa115275aa73')

build() {
  cd $pkgname
  go build -v -mod=vendor -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  cd "$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
