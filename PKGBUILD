# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=flapc
pkgver=1.2.0
pkgrel=1
pkgdesc='The Flap compiler'
arch=(x86_64)
url='https://github.com/xyproto/flapc'
license=(BSD3)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('d99aab534fff9a7dfb87cedc458ee19ff98830d022dea9f285f06a2bbb0ac44beabb0ad0fb58a3bad2d573ef0dde8d1ce81bb5489df5069eeee08125363219eb')

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
