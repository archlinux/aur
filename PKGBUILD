# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=botsay
pkgver=1.2.5
pkgrel=1
pkgdesc='Like cowsay, but with randomly generated ASCII robots and color support'
arch=(x86_64)
url='https://github.com/xyproto/botsay'
license=(MIT)
makedepends=(git go)
source=("git+$url#commit=78eabcdc1a5f10a289f2066ae1dad7b644bae6d1") # tag: v1.2.5
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
