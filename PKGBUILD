# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote
pkgver=0.19.0
pkgrel=1
pkgdesc='Terminal-based, CRDT-backed, local-first, collaborative note-taking'
arch=('x86_64')
url='https://github.com/Sambigeara/fuzzynote'
license=('unknown') # https://github.com/Sambigeara/fuzzynote/issues/73
makedepends=('go' 'make')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Sambigeara/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
)
md5sums=(
  '6ef7598f38c35151463633bddd507689'
)
sha1sums=(
  '6d81fb2c2e62f6631f986755b7f0fc04826a1eab'
)
sha256sums=(
  '77abe6a9a1bbb3bfea1c315831eecc365dfd712731326f997813710684be32c1'
)
sha512sums=(
  'c587abbef65f39ddabd1d56a56879a43d6328a6fece5864ba02a0de3e95eae39d0d30460d32868910e1a7873ecc9231b69352771a1440f2f2242c204fa3890b7'
)
b2sums=(
  '58b3c7133f695f35cded11abd791f265c9e46debf2ca81e2be9cd9732c3f31c242527346a6fb3a644940e587efd7c56a2cf24359f7bbb5a046be9760125b5a54'
)

build() {
  cd "$pkgname-$pkgver" || exit 1

  # https://wiki.archlinux.org/title/Go_package_guidelines
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
    -o bin/fzn ./cmd/term
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm0755 bin/fzn   "$pkgdir/usr/bin/fzn"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# eof
