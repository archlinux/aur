# Maintainer: anze <alberto.anzellotti@gmail.com>

pkgname=nsfminer
_pkgname=nsfminer
pkgver=1.3.1
pkgrel=1
pkgdesc="Ethereum miner with OpenCL and CUDA support derived from ethminer. RTX 30 series compatible."
arch=('x86_64')
url="https://github.com/no-fee-ethereum-mining/nsfminer"
license=('GPL3')
depends=('pth' 'cuda' 'mesa')
makedepends=('cmake' 'gcc' 'perl' 'python' 'git')
provides=('nsfminer')
conflicts=()
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build () {
  cd "$_pkgname"
  git submodule update --init --recursive

  mkdir -p build && cd build
  
  cmake .. -DETHASHCL=OFF -DETHASHCUDA=ON -DCMAKE_BUILD_TYPE=Release
  cmake --build .
}

package() {
  cd "$_pkgname/build"
  make DESTDIR=$pkgdir install
}
