# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=ollamaurl
pkgver=1.0.1
pkgrel=1
pkgdesc='See what ollama pull would have fetched'
arch=(x86_64)
url='https://github.com/xyproto/ollamaurl'
license=(BSD-3-Clause)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('2dfaec17d68b76ab0d004f9f9a4d65e1230c778a710aa361b6ede72453c5a4c2251b2cf01e8b6469f058dc31d030be605b3adeaac67ec5a48c41f1323079fc4f')

build() {
  cd $pkgname
  go build -mod=readonly -v -trimpath -buildmode=pie -ldflags="-s -w -extldflags '$LDFLAGS'"
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" $pkgname/$pkgname
  install -Dm755 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname/LICENSE
}
