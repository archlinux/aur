# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=interfaces
pkgver=1.2.3
pkgrel=1
pkgdesc='List all network interfaces'
arch=(x86_64)
url='https://github.com/xyproto/interfaces'
license=(BSD)
makedepends=(git go)
source=("git+$url#commit=800a7f6e08016efd0ce92a79d5e33c564d694b38") # tag: v1.2.3
b2sums=(SKIP)

build() {
  cd $pkgname
  go build -v -mod=vendor -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  cd "$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
