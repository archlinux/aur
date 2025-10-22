# Maintainer: Alexander <xyproto@archlinux.org>

pkgname=flapc
pkgver=1.1.0
pkgrel=1
pkgdesc='The Flap compiler'
arch=(x86_64)
url='https://github.com/xyproto/flapc'
license=(BSD3)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('c1db0bf5d9bcc3a5d6d178453dcf6077178bf10ea6915e7b7f5eefaf14f0720b4212e5fe1c6a6c7df5cf8d81216837d31cf8ed34c2271ca668e85d38a02e761d')

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
