# Maintainer: kpcyrd <git@rxv.cc>

pkgname=badtouch
pkgver=0.5.1
pkgrel=2
pkgdesc="Scriptable network authentication cracker"
url="https://github.com/kpcyrd/badtouch"
depends=('openssl' 'libcap')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
install='badtouch.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/kpcyrd/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('743be329260cefa251f32002a1015b10b9815a3ee91e3baad0b94f948f8b528ca3c564b7f48b0b6088dbbea9c7e0e595541031e2a774381b1dbdab6c5e149d17')

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
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 docs/badtouch.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 scripts/* -t "$pkgdir/usr/share/doc/$pkgname/examples"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
