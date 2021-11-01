# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Alex Gu <gualse.mail@yandex.com>
# -*- mode: sh -*-

pkgname='mycorrhiza'
pkgver=1.6.0
pkgrel=1
pkgdesc='Filesystem and git-based wiki engine written in Go using mycomarkup'
arch=('x86_64' 'armv7h')
url="https://github.com/bouncepaw/$pkgname"
license=('AGPL3')
depends=('git')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
provides=('mycorrhiza')
conflicts=('mycorrhiza' 'mycorrhiza-bin')
md5sums=(
  '3591046525db38088a4dcffe24407e7b'
)
sha1sums=(
  '608995c2c7678ea8c12e5c526143d4499d7b9974'
)
sha256sums=(
  'bbc197cf11b47ee14d4c65d25994766ab14679aad53ef25e52fdc67900b3e20c'
)
sha512sums=(
  'b3f86af24977aa19968afb78c24de19e6cde2ee5f536f1898fc510b288c36327ce5e9dcaa54a48bd57e7116b223cf1f56e0ee69f0ca2df4af30c00e859c89264'
)
b2sums=(
  '0c32cef7d2ec305ef8fccd277686f494d98445498aa385c420364ac290d1ca8bc6f3365d6a9b0be8af21f6458a95dfda452bdbcdb589760184890ee7a43b2097'
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
