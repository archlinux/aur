# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=botsay
pkgver=1.4.1
pkgrel=1
pkgdesc='Like cowsay, but with randomly generated ASCII robots and color support'
arch=(x86_64)
url='https://github.com/xyproto/botsay'
license=(BSD-3-Clause)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('9db66aa6bf8d31b557f1d3fbfadb18b22362088988fec89b0bcc9385429f8c1fc344241191b81a67e7770c7d36926225732511f8d9f29af3011d0bdf02265f3f')

build() {
  cd $pkgname
  go build -v -mod=vendor -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
