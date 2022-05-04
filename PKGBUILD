# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=atto
pkgver=1.5.0
pkgrel=1
pkgdesc='A tiny Nano wallet, focused on ease of use through simplicity'
arch=('x86_64')
url='https://github.com/codesoap/atto'
license=('MIT')
makedepends=('go')
provides=('atto')
conflicts=('atto')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

build() {
  cd "$pkgname-$pkgver" || exit 1

  # https://wiki.archlinux.org/title/Go_package_guidelines
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'

  go build ./cmd/atto
  go build ./cmd/atto-safesign
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm0755 atto          "$pkgdir/usr/bin/atto"
  install -Dm0755 atto-safesign "$pkgdir/usr/bin/atto-safesign"
  install -Dm0644 README.md     "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  'c9c662cd8ade26d0066022fe4a09b408bb1de4ecbc48715561fe75e1971bb933'
)
sha512sums=(
  '07ed4c1acb2269057e802c2b4170fe5718845b01a6739d15aca4019ed4cfce28ffb77612b88982bfa70dce804240e7feea552f13857a368cf0453570bfad37e4'
)
b2sums=(
  '06ecae3ded378dfae3fec3ec4e47da4744d40dbe2c0af18ebc174fc68e457c0b95340207e28915aa8c0394206ec04f22728f1bb18a68a141f40229bd901e1ef5'
)

# eof
