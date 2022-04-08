# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=binary
pkgver=1.1.0
pkgrel=1
pkgdesc='Utility for checking if a file is text or a binary file'
arch=(x86_64)
url='https://github.com/xyproto/bin'
license=(BSD)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('SKIP')

build() {
  cd bin/cmd/$pkgname
  go build -mod=vendor -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" bin/cmd/$pkgname/$pkgname
}
