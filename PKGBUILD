# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=atto
pkgver=1.3.0
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
  '6f0c8ce8411d59ceb4645c71a60c6173'
)
sha1sums=(
  'e2e157b03368d24051456325b7e96ba0b02f9e99'
)
sha256sums=(
  '040f80e1d366605c744a67d32dda3f795bc3e28ea2fdbb79c939f90fe8dd9c42'
)
sha512sums=(
  'ed8133bf24b7e21a08981beabff0a404033f2fb4896a437ec346de5927a4718fa6d3cab3252971cbefc885183d04fa586267a3f0028afb0a97cb27333b54b675'
)
b2sums=(
  'bb0da975dc1d0867283604e0ca6462a73b10c3db28ba4bdad951775f59d011b863e86f380c649b2c730445a8445c4a563440fcadc9f333c1f065a3d74e4638f5'
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
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm0755 atto      "$pkgdir/usr/bin/atto"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
