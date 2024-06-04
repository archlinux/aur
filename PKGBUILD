# Maintainer: tarball <bootctl@gmail.com>

pkgname=minica
pkgver=1.1.0
pkgrel=1
pkgdesc='Small, simple CA for use when the operator also controls each client'
url='https://github.com/jsha/minica'
arch=(i686 x86_64 aarch64 riscv64)
license=(MIT)
makedepends=(go)
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4f56ea73d2a943656f8a5b533e554b435bc10f56c12d0b53836e84a96b513bf7')

build() {
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  cd "$srcdir/$pkgname-$pkgver"
  go build -o $pkgname
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # binary
  install -Dm755 $pkgname \
    "$pkgdir/usr/bin/$pkgname"

  # license
  install -Dm644 LICENSE.txt \
    -t "$pkgdir/usr/share/licenses/$pkgname/"

  # docs
  install -Dm644 README.md \
    -t "$pkgdir/usr/share/doc/$pkgname/"
}
