# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=ollamaurl
pkgver=1.0.0
pkgrel=1
pkgdesc='See what ollama pull would have fetched'
arch=(x86_64)
url='https://github.com/xyproto/ollamaurl'
license=(BSD-3-Clause)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('5357964be77d0449172199258e6babd37d4526875dbe7ee822260419391a9422e69a8cda0c5386819528f672414f9d9fd63a2486cc0609a71e549ecd2f97a059')

build() {
  cd $pkgname
  go build -mod=readonly -v -trimpath -buildmode=pie -ldflags="-s -w -extldflags '$LDFLAGS'"
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" $pkgname/$pkgname
  install -Dm755 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname/LICENSE
}
