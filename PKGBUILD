pkgname=notify-complete
pkgver=0.1.1
pkgrel=1
pkgdesc="Run a command and display a system notification upon completion"
arch=("x86_64")
url="https://github.com/andybug/notify-complete"
license=(MIT)

depends=(dbus)
makedepends=(rust cargo)

source=("https://github.com/andybug/notify-complete/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("2c227b6fde84b3779cae32c8ba32e3bed2eb3ce6cfea6cdfc84e804801e45b1ba25bc8a51429d7721f57d3045847f62643e86f4921e654658a36d06cafbf14bb")

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
}
