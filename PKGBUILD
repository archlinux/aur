# Contributor: Afri 5chdn <aur@5chdn.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethminer
pkgver=0.13.0
pkgrel=2
pkgdesc="Ethereum miner with OpenCL and stratum support (built without CUDA)."
arch=('x86_64')
url="https://github.com/ethereum-mining/ethminer"
license=('MIT')
depends=('mesa')
makedepends=(
  'cmake'
  'python'
)
conflicts=('ethereum')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ethereum-mining/ethminer/archive/v$pkgver.tar.gz")
sha256sums=('72bf827a922b797d556f8f03980185c4857bb82074b4c8b5f63b5d5e140893b8')

build () {

  cd "$pkgname-$pkgver"
  mkdir -p build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}


package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR=$pkgdir install
}
