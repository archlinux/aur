# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=interfaces
pkgver=1.3.0
pkgrel=1
pkgdesc='List all network interfaces'
arch=(x86_64)
url='https://github.com/xyproto/interfaces'
license=(BSD)
makedepends=(git go)
source=("git+$url#commit=e04cb1454295543b18734ea36f50dd54eb16ff34") # tag: v1.3.0
b2sums=('SKIP')

build() {
  cd $pkgname
  go build -v -mod=vendor -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  cd "$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
