# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=bato
pkgver=0.2.2
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
sha256sums=('8e987fdb812f28149c939a470adcbf683212f461d066dd6774424dc746285d46')
_pkgdir="$pkgname-$pkgver"

build() {
  cd "$srcdir/$_pkgdir"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$_pkgdir"
  install -Dm755 "$srcdir/$_pkgdir/target/release/bato" "$pkgdir/usr/bin/bato"
  install -Dm644 "$srcdir/$_pkgdir/bato.toml" "$pkgdir/usr/share/bato/bato.toml"
}

