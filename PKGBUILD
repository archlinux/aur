# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=bato
pkgver=0.2.0
pkgrel=2
pkgdesc='A daemon to send battery level notifications'
arch=('x86_64')
url='https://github.com/doums/bato'
license=('MPL-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'cargo')
provides=('bato')
conflicts=('bato')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a452a4bc8dcfac91e90e45e1f31eb632cef8c0bdac316f96b81accb8798e1411')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/bato" "$pkgdir/usr/bin/bato"
  install -Dm644 "bato.toml" "$pkgdir/usr/share/bato/bato.toml"
}

