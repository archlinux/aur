# Maintainer: kpcyrd <git@rxv.cc>

pkgname=burritun
pkgver=0.1.1
pkgrel=1
pkgdesc="Wrap a tun device in a tap device"
url="https://github.com/kpcyrd/burritun"
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
source=("https://github.com/kpcyrd/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2a43bb16fb1a6f80b85f2ecbfa2f6e3bcea3a7650bfa1b3249e67f6b5688622a7f4fbaad93fd7177945628f1f692bf11c1a5374e8cdd033bed3565885ce63c6e')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
