# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=botsay
pkgver=1.2.2
pkgrel=1
pkgdesc='Like cowsay, but with randomly generated ASCII robots and color support'
arch=(x86_64)
url='https://github.com/xyproto/botsay'
license=(MIT)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd $pkgname

  go build \
    -asmflags "all=-trimpath=$PWD" \
    -buildmode=pie \
    -gcflags "all=-trimpath=$PWD" \
    -ldflags "-s -w -extldflags $LDFLAGS"
}

package() {
  cd "$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
