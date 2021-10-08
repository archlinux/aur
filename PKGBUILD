# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=atto
pkgver=1.4.0
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
  'f2aad9484ce412773f28964aa65af1dd'
)
sha1sums=(
  '5ea5cbdba8d04ad6cd9c87acf377b35ade9bfb04'
)
sha256sums=(
  '2cb206b069484fa4a7732669f236fc6182786ec8d7bdcd4933d0aa17200e3eb7'
)
sha512sums=(
  '194d0d58a70ce4c4fd5677ff9fe7995cc4de7c9eb63876c0563297f5ab1d43011be0ffb05151543997bea8ddde655354b51cb340f73b653d0ccf9c75bdecd675'
)
b2sums=(
  '411315fd3cf2ac13b42c4885182d2bfa81077f60607f11a9eaf9f6415354fcf13d0219dc9b228970aa4cbc5f34438fc79f77e8438933d2b9f7918b76ab168084'
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
