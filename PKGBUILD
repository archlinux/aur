# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=flapc
pkgver=1.1.1
pkgrel=1
pkgdesc='The Flap compiler'
arch=(x86_64)
url='https://github.com/xyproto/flapc'
license=(BSD3)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('aaaaf54ab3f7cce4769378c315b069f2f7358a4847ae9c144b7dea91baf6b2be9af3838cadf9a18ea3adfa4403b2b4587d51a5f3222a06339e57d5c3e3b22d62')

build() {
  cd $pkgname
  go build -v -mod=vendor -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
