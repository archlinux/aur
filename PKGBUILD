# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote
pkgver=0.21.0
pkgrel=1
_pkgdate=1625579667
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
md5sums=(
  '83fd1114bc18286731cb8a4ffa92cd3c'
)
sha1sums=(
  '10f6f0a78ceeefe7e3f124977cdbb9d87f317b88'
)
sha256sums=(
  '5d7003c8be4126bc1f97b0b51d0b06cf229fda1667af00e274a5088f0e2f8124'
)
sha512sums=(
  '96cb67d04fe98681add011e971a0ceb6f72effa1ec903ef6a76e23f213a3de1ce8228d59734d4c554812738d2d868960d222dbc419a1e2b797714d46105bbaa4'
)
b2sums=(
  'ceaa5349859aedd7e27bd94384a61a175620c0707f4c9ee897be6fd15c6e18f2b114b96617ba32f413f062537cec5e3f2795b22ad617739f49653683fb239c83'
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
