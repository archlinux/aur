# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote
pkgver=0.22.0
pkgrel=1
_pkgdate=1644244661
pkgdesc='Terminal-based, CRDT-backed, local-first, collaborative note-taking'
arch=('x86_64')
url='https://github.com/Sambigeara/fuzzynote'
license=('AGPL3')
makedepends=('go')
provides=('fuzzynote')
conflicts=('fuzzynote')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Sambigeara/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
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

sha256sums=(
  '9fb43b5819d160b8f01ac56057af9b5cfae87c6c8927e7c8cd81589aa5166f0c'
)
sha512sums=(
  '9b45b0bb40cb3d985aacdf1d273314ccb00ff0e4c063f1f5a075727e67e25857e73d429333dd1215aba6f1c2dfc718703b0a0371c599dcb0762006b19fab874d'
)
b2sums=(
  '19316eb1f0c98c742524657f7d20612faec0a206d1711564b303159d2c1e52613e59cdf61f889ad0505864654b0acb9f1cf91247e430d6f603e32316230ed352'
)

# eof
