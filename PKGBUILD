# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=botsay
pkgver=1.2.7
pkgrel=1
pkgdesc='Like cowsay, but with randomly generated ASCII robots and color support'
arch=(x86_64)
url='https://github.com/xyproto/botsay'
license=(BSD-3-Clause)
makedepends=(git go)
source=("git+$url#commit=694a159fc918067f4537a661f83db758e576c4d5") # tag: v1.2.7
b2sums=(SKIP)

build() {
  cd $pkgname
  go build -v -mod=vendor -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
