# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote
pkgver=0.24.0
pkgrel=1
_pkgdate=1648573039
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
  'ef77e8adcd5dc2ef01b779543d06926eb7949feb9c94c13dc2f83ec6bdb956d0'
)
sha512sums=(
  '1818c47713426adf7fb4d172f2f38a39a6047abccebd3b84e35404eedc214441aa7dcf72ab7aec8470b260d7cfc54f9e91bbb4b869189c74b598aa24c908d478'
)
b2sums=(
  '59f48d2affa2efba187a650f93cc96fccd39b05fe7db9f3dffa01c4177f7f924b1dc52432c0d5de7009bec969a37c946172377e4ce95ef8692a8b4c12e6d7a76'
)

# eof
