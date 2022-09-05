# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Alex Gu <gualse.mail@yandex.com>
# -*- mode: sh -*-

pkgname='mycorrhiza'
pkgver=1.12.1
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
  '0cbe35c6db297cc5498a6d9fc3b95fa1aa869d3521ff21d6546440f84244c96c'
)
sha512sums=(
  '8933365265acd59ba3e09c9a83eb20973145ca58c4c9115df6abc696e65c643f32a01a2d35437dbe4922b407a661de6bca62667d3064d499f4d54bfa50b10796'
)
b2sums=(
  '58694450b9b68526fb52f8cab6cf2208c3eec8482609009035e848684d8bb32c882b80923d69d086e56d24c5f0dc7b72c0eca0bacf061791d2a17c6c84d0e2bd'
)

# eof
