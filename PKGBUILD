pkgname=notify-complete
pkgver=0.1.0
pkgrel=1
pkgdesc="Run a command and display a system notification upon completion"
arch=("x86_64")
url="https://github.com/andybug/notify-complete"
license=(MIT)

depends=(dbus)
makedepends=(rust cargo)

source=("https://github.com/andybug/notify-complete/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("edf83e4bdb7049abaa1090055b7db4a01bda65dca6ba1f7027a8407c029c4b0565fc2c427c9468b1dcc85ba6fcdbd13ac1d6c9d06048b8e7c15aa583c0ee5a4b")

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
