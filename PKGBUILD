# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=bato
pkgver=0.2.1
pkgrel=1
pkgdesc='A program to send battery level notifications'
arch=('x86_64')
url='https://github.com/doums/bato'
license=('MPL-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'cargo')
provides=('bato')
conflicts=('bato')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('317e80aee78a35a48818743dccb9b5c15df00b4435255c5b8232eece9f2bb2df')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/bato" "$pkgdir/usr/bin/bato"
  install -Dm644 "bato.toml" "$pkgdir/usr/share/bato/bato.toml"
}

