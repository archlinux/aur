# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=atto
pkgver=1.4.1
pkgrel=1
pkgdesc='A tiny Nano wallet, focused on ease of use through simplicity'
arch=('x86_64')
url='https://github.com/codesoap/atto'
license=('MIT')
makedepends=('go')
provides=('atto')
conflicts=('atto')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
md5sums=(
  '3511eb2abe53bc610dc16df674b12546'
)
sha1sums=(
  '917451ada0f23839450ff1e78fb640bcfe87a69b'
)
sha256sums=(
  '5f62539cec81fa3847222907186dc02df353b9e43b2d9fe400cdc2f3cf9cf781'
)
sha512sums=(
  '844c6bb0bc7fb1655d7c39dd58c963427c8748f26f8b1021a765accc68cf5192376f84a54edc2f5dc2454d2f30684ce3088b0ba1576222f15ec77a378aecb0f1'
)
b2sums=(
  '8954a4e1af9e13265f650df6a7bb2de6dde7475533b0b000fb94672d232007b8fec11ff1bd7589977a37804dd38ff171768c5daea7520e0d1de55eb0a2f295b3'
)

build() {
  cd "$pkgname-$pkgver" || exit 1

  # https://wiki.archlinux.org/title/Go_package_guidelines
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'

  go build ./cmd/atto
  go build ./cmd/atto-safesign
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm0755 atto          "$pkgdir/usr/bin/atto"
  install -Dm0755 atto-safesign "$pkgdir/usr/bin/atto-safesign"
  install -Dm0644 README.md     "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
