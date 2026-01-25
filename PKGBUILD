# Maintainer: tarball <bootctl@gmail.com>

pkgname=psitop
pkgver=1.1.3
pkgrel=1
pkgdesc='top for /proc/pressure'
url='https://github.com/jamespwilliams/psitop'
arch=(i686 x86_64 aarch64 riscv64)
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('15bddcdd6da148e8d89297778027d4bdb7c882e3d087a5500d1e3de015370ebe')

build() {
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$srcdir/$pkgname-$pkgver"
  go build -o $pkgname
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
