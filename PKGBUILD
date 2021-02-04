# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=in
pkgver=1.4
pkgrel=1
pkgdesc='Create a directory if needed, then run the given command there'
arch=(x86_64)
url='https://github.com/xyproto/in'
license=(MIT)
makedepends=(git go)
source=("git+$url#commit=c0b1c3c2c1b229f703d2d066e9bc4c0d169c3c80") # tag: 1.4
sha256sums=('SKIP')

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
