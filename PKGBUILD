# Maintainer: kpcyrd <git@rxv.cc>

pkgname=badtouch
pkgver=0.3.0
pkgrel=1
pkgdesc="Scriptable network authentication cracker"
url="https://github.com/kpcyrd/badtouch"
depends=('openssl')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kpcyrd/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('c0eff9add9196bac3bf65f1304631ed60256f53f35d6f91c7abfa726385bd787611bf32caf4415e2eb8756b0c401b09f12a2793627506a96027014dd3024956b')

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
