# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=guessica
pkgver=0.0.2
pkgrel=2
pkgdesc='Update a PKGBUILD file by guessing the latest version number and finding the latest git tag and hash online'
arch=(x86_64)
url='https://github.com/xyproto/guessica'
license=(BSD)
makedepends=(git go-pie)
source=("git+$url#commit=2afb38633742875c96f3248c6bd02c1b0e083bde") # tag: v0.0.2
sha256sums=('SKIP')
options=(!strip)

build() {
  cd $pkgname/cmd/$pkgname
  go build -buildmode=pie -gcflags="all=-trimpath=$PWD" -asmflags "all=-trimpath=$PWD" -ldflags "-s -w -extldflags $LDFLAGS"
}

package() {
  cd $pkgname
  install -Dm755 cmd/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
