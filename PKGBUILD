# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethereum
pkgver=poc.8
pkgrel=1
pkgdesc="Decentralised Consensus-based Deterministic Transaction Resolution Platform"
arch=('i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'curl'
         'crypto++'
         'gmp'
         'jsoncpp'
         'leveldb'
         'libjson-rpc-cpp-git'
         'libmicrohttpd'
         'miniupnpc'
         'ncurses'
         'nodejs'
         'openssl'
         'python2'
         'qt5-base'
         'qt5-declarative'
         'qt5-quick1'
         'qt5-quickcontrols'
         'qt5-webkit'
         'readline'
         'snappy')
makedepends=('autoconf'
             'automake'
             'cmake'
             'gcc'
             'libtool'
             'yasm')
groups=('ethereum')
url="https://code.ethereum.org"
license=('GPL')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/ethereum/cpp-$pkgname/tar.gz/poc-8-tag)
sha256sums=('0d031e90e399d9c59bdc279bfddac2f6a4887f753ba6eb317892669a1825c119')
provides=('alethzero'
          'cpp-ethereum'
          'eth'
          'ethereum'
          'lllc'
          'mix'
          'neth'
          'sc'
          'solc'
          'third')
conflicts=('alethzero'
           'cpp-ethereum'
           'elixir'
           'eth'
           'ethereum-serpent'
           'lllc'
           'mix'
           'neth'
           'sc'
           'secp256k1'
           'solc'
           'third')

build() {
  cd "$srcdir/cpp-$pkgname-poc-8-tag"

  msg 'Building...'
  mkdir -p build && pushd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=Release \
           -DVMTRACE=0 \
           -DEVMJIT=0 # EVMJIT does not compile
  make
  popd
}

package() {
  cd "$srcdir/cpp-$pkgname-poc-8-tag"

  msg 'Installing...'
  make DESTDIR="$pkgdir" install -C build
}
