# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Alex Gu <gualse.mail@yandex.com>
# -*- mode: sh -*-

pkgname='mycorrhiza'
pkgver=1.12.0
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
  '388f0153ce1ce0122c51195fcf031419c3ef2aa44340173429ffc526cd35a1f1'
)
sha512sums=(
  '6db172accca84b73e9d20628171d7ee5930fd98f326b3d951dc9ce71ccf7bcd1a3163e7a7767572e2ba3bfaa5c75d7b7ef17aa16009bf1007428bae7f1cb310b'
)
b2sums=(
  'b940a1fa388d194660d89cee96625e161a049901aad0efe78c0a74424a978a5575b05a717efb441ccc1057acb660ea5591cbf89689a4a5dc6b02fad1115e7507'
)

# eof
