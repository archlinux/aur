# Maintainer: Tom Zander

pkgname=flowee-pay
pkgver=2021.07.0
pkgrel=1
pkgdesc="Flowee Payment solution"
arch=('x86_64' 'aarch64')
url="http://flowee.org/"
license=('GPL3')
depends=('qt5-base')
makedepends=('boost' 'cmake' 'flowee>=2021.06.0')
provides=('flowee-pay')
source=("https://gitlab.com/FloweeTheHub/pay/-/archive/$pkgver/pay-$pkgver.tar.gz"
    "https://flowee.org/products/pay/blockheaders")
sha256sums=('0cd5c1d7717d6e1fa57492ed730523e682ac8e81af95cf9b8b54a1033b12696a'
    '8c2dfde998b4472aea25daa1e4bfe7bcca0b765145ee740bd8cfb0152400abce')

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ ../pay-$pkgver
  make
}

check() {
    cd build/testing
    make check
}

package() {
  cd build
  make install

  install -Dm 644 "$srcdir/blockheaders" -t "$pkgdir/usr/share/floweepay"
  install -Dm 644 "$srcdir/pay-$pkgver/data/bip39-english" -t "$pkgdir/usr/share/floweepay"
}
