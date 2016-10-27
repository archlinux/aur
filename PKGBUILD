# Maintainer: Afri 5chdn <aur@cach.co>
# Available from AUR: https://aur.archlinux.org/packages/solidity/

pkgname=solidity
pkgver=0.4.3
pkgrel=1
_chash='4fc6fc2ca59579fae2472df319c2d8d31fe5bde5'
pkgdesc="The Solidity Contract-Oriented Programming Language (Including solc and lllc)"
arch=('i686' 'x86_64')
depends=(
  'boost'
  'boost-libs'
  'glibc'
)
makedepends=(
  'autoconf'
  'automake'
  'cmake'
  'gcc'
  'gcc-libs'
  'libtool'
  'git'
)
groups=('ethereum')
url="https://github.com/ethereum/solidity"
license=('GPL3')
source=("https://github.com/ethereum/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4d8437d183acec7b2a2ae46b3f20c372d4cb70ea13b515ea06089eff2391862f')
provides=(
  'lll'
  'lllc'
  'liblll'
  'solidity'
  'solc'
  'libsoldevcore'
  'libsolevmasm'
  'libsolidity'
)

build() {

  msg 'Updating...'
  cd ${srcdir}/${pkgname}-${pkgver}
  echo "${_chash}" > ${srcdir}/${pkgname}-${pkgver}/commit_hash.txt

  msg 'Building...'
  mkdir -p build && pushd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
  popd
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  msg 'Installing...'
  make DESTDIR="$pkgdir" install -C build
}
