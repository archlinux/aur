# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=promscale_extension
pkgver=0.1.1
pkgrel=1
pkgdesc="PostgreSQL extension for Promscale"
arch=('x86_64')
url="https://github.com/timescale/promscale_extension"
license=('Apache' 'custom:Timescale')
depends=(postgresql)
makedepends=(rust clang llvm)
_tslver=1.7.4 # latest version of Timescale - used to pin license version
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "LICENSE-TIMESCALE-$_tslver::https://raw.githubusercontent.com/timescale/timescaledb/$_tslver/tsl/LICENSE-TIMESCALE")
b2sums=('10ea7f5fed2693228314e663aee464ede5d5ba23d1d39159cd231f6fbb7e72735c4d97d94b4a528f0372615c0f64a3a7bc055671640a0b1af085f75010b4024b'
        'e8823fbfed8c9bc8738387d1b60b7507a1e492f3fffa18036e3016d0882d71d34dff380413ce86673b3496868dae6f64d0204769fa3540a62fb6d757af59222c')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 "$srcdir/LICENSE-TIMESCALE-$_tslver" "$pkgdir/usr/share/licenses/LICENSE-TIMESCALE"
}
