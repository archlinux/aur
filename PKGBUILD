# Maintainer: ml <>
pkgname=hurl-rs
pkgver=1.5.0
pkgrel=1
pkgdesc='HTTP Client to run and test requests'
arch=('x86_64')
url='https://github.com/Orange-OpenSource/hurl'
license=('Apache')
depends=('curl' 'libxml2')
makedepends=('cargo' 'python')
source=("$url"/archive/"$pkgver"/hurl-"$pkgver".tar.gz)
sha512sums=('3533ff7500cc3448215123f961378dc13cda0e034fea33e1118958b6303693a9a141934cdb0b82ee5cff091e7c77c6dfce97a8207a46e2edecbdc619ddb9f61a')

build() {
  cd hurl-"$pkgver"
  cargo build --release --locked
  ./ci/man.sh
}

package() {
  cd hurl-"$pkgver"
  install -Dm755 target/release/hurl{,fmt} -t "$pkgdir"/usr/bin
  install -Dm644 target/man/hurl{,fmt}.1.gz -t "$pkgdir"/usr/share/man/man1
}
