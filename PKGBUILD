# Maintainer: Tom Zander

pkgname=flowee-pay
pkgver=2021.05.0
pkgrel=1
pkgdesc="Flowee Payment solution"
arch=('x86_64' 'aarch64')
url="https://flowee.org/"
license=('GPL3')
depends=('qt5-base')
makedepends=('boost' 'cmake' 'flowee>=2021.05.0')
provides=('flowee-pay')
source=("https://gitlab.com/FloweeTheHub/pay/-/archive/$pkgver/pay-$pkgver.tar.gz"
    "https://flowee.org/products/pay/blockheaders")
sha256sums=('592eeb0f07ae639f48d01f562906d7dcba6a0df360911012fd46ef20955c0bfe'
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
}
