# Maintainer: Noel Maersk veox+packages the veox toad pw
# Contributor: Nicola Squartini tensor5 the gmail toad com

pkgname=lll
_reponame=solidity
pkgver=0.4.21
_commit=dfe3193c7382c80f1814247a162663a97c3f5e67
pkgrel=1
pkgdesc='The Lovely Little Language compiler for Ethereum smart contracts'
arch=('x86_64')
url='https://github.com/ethereum/solidity'
license=('GPL3')
depends=('gcc-libs')
makedepends=('boost' 'cmake' 'git')
provides=('lllc')
conflicts=() # 'solidity-git' claims to provide this but doesn't
source=("git+https://github.com/ethereum/solidity.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_reponame"

  mkdir -p build
  cd build
  cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DTESTS=OFF \
      ..
  make lllc
}

package() {
  cd "$srcdir/$_reponame/build"

  install -D lllc/lllc "$pkgdir/usr/bin/lllc"
}

# vim:set ts=2 sw=2 et:
