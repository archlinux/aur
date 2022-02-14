# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote
pkgver=0.23.0
pkgrel=1
_pkgdate=1644846759
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
  '3987ddadc8f55763d9668278cc98ec5cc929a38d5d5fa25b5dc776eaa0690920'
)
sha512sums=(
  '4bc2db67dd100c3b22aca51edbc2437bee0aa0bfc19170eef44a9403b99910de943d3537f7234b94eb085678f931b132964cd345586c8a339841e5fa108372b7'
)
b2sums=(
  'e721e4e7f438b62cd3d046d709eb40e8098482e9854a5332b4438e9e7db25f53ce6c859141072ce6a2e07c34f428942207ee9e04d3b36055f99fb8ab00736137'
)

# eof
