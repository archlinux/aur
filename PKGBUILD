# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Alex Gu <gualse.mail@yandex.com>
# -*- mode: sh -*-

pkgname='mycorrhiza'
pkgver=1.13.0
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
  '7c84735ada19f2d44da90ba9832a62f6d420146a5bfb252a56074ad952f04ded'
)
sha512sums=(
  '5fb6f129e302fd1748d7cf985edb48c05bbc77d2c118d476d92ddc4e9cfd3aafbf570eef4c5b3235d6a0a42996d63fb5a5441592ad90626e2e60919e83fe6e70'
)
b2sums=(
  '2f2451f4b1b073213a8e5188d617b46b85705f3157ef24af729463200db3aaadf1a72ee0555d64401cbaf6e7d2550778efc6ea3ad4efd4b69833e56f9ba331a3'
)

# eof
