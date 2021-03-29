# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=promscale_extension
pkgver=0.1.2
pkgrel=1
pkgdesc="PostgreSQL extension for Promscale"
arch=('x86_64')
url="https://github.com/timescale/promscale_extension"
license=('Apache' 'custom:Timescale')
depends=(postgresql)
makedepends=(rust clang llvm)
_tslver=2.1.1 # latest version of Timescale - used to pin license version
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "LICENSE-TIMESCALE-$_tslver::https://raw.githubusercontent.com/timescale/timescaledb/$_tslver/tsl/LICENSE-TIMESCALE")
b2sums=('162a41816505cfe89bed2e2553a0763b4056ca2ea14dd9bf944e49dd4d5f3c18ac2839008fac3bed9d9771f1ff133158155faa72d5d8236a688aa7daa880e9f2'
        '32bf2e976bf68df573329b3e83fe0060557f1c09859dc12f1c1070e6c2ecb29ee9699e981900e39b3a3ccd41384d28ab7a81bcc953e0d34f00d0048d0f1ea028')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # licenses
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 "$srcdir/LICENSE-TIMESCALE-$_tslver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-TIMESCALE"
}
