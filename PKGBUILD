# Maintainer: kpcyrd <git@rxv.cc>

pkgname=sn0int
pkgver=0.2.0
pkgrel=1
pkgdesc="OSINT framework and package manager"
url="https://github.com/kpcyrd/sn0int"
depends=('libcap' 'sqlite' 'libseccomp')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL3')
install='sn0int.install'
source=("https://github.com/kpcyrd/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('15b95b8d92d408043a6fe952aca980c402d253dfd8ab14d835b4242f9c1bc157')

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
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
