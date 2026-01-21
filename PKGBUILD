# Maintainer: Andrew Fields <andy at andybug dot com>
pkgname=pathsearch
pkgver=0.2.1
pkgrel=1
pkgdesc="Search PATH for executables"
arch=("x86_64")
url="https://github.com/andybug/pathsearch"
license=(MIT)

# depends=(dbus)
makedepends=(rust cargo)

source=("https://github.com/andybug/pathsearch/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("83389201344b874b255359e355fb341d886184524fdde1d6bf568aa728e632275732aabadf75bd4b7ffd3bd112513e763701b8f7bb0b2139f372710772938f61")

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
