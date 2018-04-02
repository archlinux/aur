# Maintainer: kpcyrd <git@rxv.cc>

pkgname=badtouch
pkgver=0.4.0
pkgrel=1
pkgdesc="Scriptable network authentication cracker"
url="https://github.com/kpcyrd/badtouch"
depends=('openssl')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kpcyrd/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('23425694a7e668fdb38fe0860727ec063658d2d7d82648311b3c4887951cf8ef399acf70d25c217d25309f20af82519195e9a04e0937c0e5722c1657ad5b0d14')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 docs/badtouch.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 scripts/* -t "$pkgdir/usr/share/doc/$pkgname/examples"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
