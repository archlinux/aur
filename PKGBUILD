# Maintainer: Andrew Fields <andy at andybug dot com>
pkgname=pathsearch
pkgver=0.2.2
pkgrel=1
pkgdesc="Search PATH for executables"
arch=("x86_64")
url="https://github.com/andybug/pathsearch"
license=(MIT)

# depends=(dbus)
makedepends=(rust cargo)

source=("https://github.com/andybug/pathsearch/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("945b9db77e846919f508854227cb800dfde152584d843205373156809967f567ef17b77ae2497e9792ed37bf40d6dcd0bb131ed8de7e0b49515cf2b52bb55fd2")

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --release
}

package() {
  install -Dsm 0755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"

  install -Dm 0644 "$srcdir/$pkgname-$pkgver/doc/pathsearch.1" \
    "$pkgdir/usr/share/man/man1/$pkgname.1"
}
