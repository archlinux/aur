# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote
pkgver=0.20.0
pkgrel=2
_pkgdate=1624743041
pkgdesc='Terminal-based, CRDT-backed, local-first, collaborative note-taking'
arch=('x86_64')
url='https://github.com/Sambigeara/fuzzynote'
license=('unknown') # https://github.com/Sambigeara/fuzzynote/issues/73
makedepends=('go')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Sambigeara/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
)
md5sums=(
  '3372c0714f6e8b4dcf48cc1451b4a3f2'
)
sha1sums=(
  '38f6cee02d01907d9de122f88542d599e4cb70ef'
)
sha256sums=(
  '80692fc267590cbc163b1d53d9bf0d4b082a30ab3601d23f2acf2a0f42ae9067'
)
sha512sums=(
  'eb29be8428a6ef2265057753766604064f7395eeb94a1db19066e691e14d7a0d28d8851e08f2e25accd70c784c30746ee6b7ead03822b13415c938b254fdf48f'
)
b2sums=(
  '50171ac91294a8563a9e121c64c9cbc41f0a7150fca9251f0cfd8b36e50e2379da9952aca5866ec1cda8b6423c07ce4194d34ac250e47ca1f97ac4a4c0c2c61a'
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
    -ldflags="-linkmode=external -X main.version=$pkgver -X main.date=$_pkgdate" \
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
