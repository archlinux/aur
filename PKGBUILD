# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=flapc
pkgver=1.3.0
pkgrel=1
pkgdesc='Experimental compiler for the Flap programming language'
arch=(x86_64)
url='https://github.com/xyproto/flapc'
license=(BSD3)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('48919b3789d2cb9d56a50533bbad6883cc1521435419acc1ee60235b5b462a230652bcae50129b7cce2e1001268102327c73cf5b4306ce42684c16ae2ac550ff')

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
