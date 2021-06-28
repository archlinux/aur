# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=atto
pkgver=1.2.0
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
md5sums=(
  'e0f13b9401e36659d5769f67c4113fd9'
)
sha1sums=(
  '52d4a855fbd230d5c6efd927845029e133e852af'
)
sha256sums=(
  '0af67c6fe873d186c986e8fa94a65118c5b12606a628c5e315ae216a5e65ac39'
)
sha512sums=(
  '4d1d854c29a956155e54c5b8fc1459b28422579d0c7399207cd6c6ea151837afc7272fd8a3b21c3c6c4e91a964f5b9f93f0501e5cd0597388ecde4ca2a97db5f'
)
b2sums=(
  'c0a9c6201a9c6ea2766eb56ca3e218d5cbb5407dc05c39b5f2adec77527a8997ef063430411cc754b51aec191e8c16a084d183078dd75aad4b4dc390958a1715'
)

build() {
  cd "$pkgname-$pkgver" || exit 1

  # https://wiki.archlinux.org/title/Go_package_guidelines
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'

  go build
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm0755 atto      "$pkgdir/usr/bin/atto"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
