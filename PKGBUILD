# Maintainer: Andrew Fields <andy at andybug dot com>
pkgname=pathsearch
pkgver=0.2.3
pkgrel=1
pkgdesc="Search PATH for executables"
arch=("x86_64")
url="https://github.com/andybug/pathsearch"
license=(MIT)

# depends=(dbus)
makedepends=(rust cargo)

source=("https://github.com/andybug/pathsearch/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("b0a0c54d24eb6333e7432f8a051750dc8d38edad88425605960827308b52f5840662198171fe64a98d7d371aef284c18234c4e8e9103768291e725a1baac54e5")

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
