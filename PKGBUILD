# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Alex Gu <gualse.mail@yandex.com>
# -*- mode: sh -*-

pkgname='mycorrhiza'
pkgver=1.11.0
pkgrel=1
pkgdesc='Filesystem and git-based wiki engine written in Go using mycomarkup'
arch=('x86_64' 'armv7h')
url="https://codeberg.org/bouncepaw/$pkgname"
license=('AGPL3')
depends=('git')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
provides=('mycorrhiza')
conflicts=('mycorrhiza')

build() {
  cd "$pkgname" || exit 1

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go mod tidy

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.version=$pkgver" \
    -mod=readonly \
    -modcacherw \
     .
}

package() {
  cd "$pkgname" || exit 1

  install -Dm0755 "mycorrhiza"        "$pkgdir/usr/bin/mycorrhiza"
  install -Dm0644 "README.md"         "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 "help/mycorrhiza.1" "$pkgdir/usr/share/man/man1/mycorrhiza.1"
}

sha256sums=(
  '139f40b22f6535fc10ac229fe18c1b140917901a8582d14999f1585ea057fcb8'
)
sha512sums=(
  'ce4f326de3c8b2b75d6fbc742886057cebfe97ad79d8903a6fa061720db666c39e19ea4c0f0180b1ddff63703111190ec7e9b97e25f7c12575d197972763e5fb'
)
b2sums=(
  'a372a543be2c7c744c338352f1ca1a6df60a478da70c16dd8b5394cee701b16f5737b7789bc602a468a6a346f74a62252678690910431c0f915ebdebcf75d498'
)

# eof
