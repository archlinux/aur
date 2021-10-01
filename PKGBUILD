# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Alex Gu <gualse.mail@yandex.com>
# -*- mode: sh -*-

pkgname='mycorrhiza'
pkgver=1.5.0
pkgrel=3
pkgdesc='Filesystem and git-based wiki engine written in Go using mycomarkup'
arch=('x86_64')
url="https://github.com/bouncepaw/$pkgname"
license=('AGPL3')
depends=('git')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
provides=('mycorrhiza')
conflicts=('mycorrhiza' 'mycorrhiza-git')
md5sums=(
  '9e7050204ec27b96b8f156f2b6436265'
)
sha1sums=(
  '016b292548bc33dec0ab9ac59d1d76f4a8b79c79'
)
sha256sums=(
  '7f0f331afb341ec146464b103d2dc542e12fd00955aed11e60d3281a039f9d04'
)
sha512sums=(
  '03432807a7ee63b54fa377b61612fe0da5c6df27132e2c6c37db736cd5e142b1c5fd77d75cd728eb4d8e927ae896edcf78b4771ae59b0495d402cbd4700a7b4e'
)
b2sums=(
  'd67395e2e3e73c997cf9ffeb887487e44cfc8ad6d16d72217a030d2a4be92cd1df49a11722621ed36bbad0d2c3b1f4d6ef8581fe4ebc990a7da27e5cecea0614'
)

build() {
  cd "$pkgname-$pkgver" || exit 1

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.version=$pkgver" \
    -mod=readonly \
    -modcacherw \
     .

}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm0755 "mycorrhiza" "$pkgdir/usr/bin/mycorrhiza"
  install -Dm0644 "README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# eof
