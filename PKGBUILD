# Maintainer: Afri 5chdn <aur@5chdn.co>
# Contributor: David Parrish <daveparrish@tutanota.com>

pkgname=geth-git
pkgver=1.6.7.r24.g3a678a15c
pkgrel=1
pkgdesc="Ethereum Go Client"
arch=('i686' 'x86_64')
url="https://github.com/ethereum/go-ethereum"
license=('LGPL3' 'GPL3')
depends=('glibc')
makedepends=('go' 'gmp')
conflicts=(
  'geth-git'
  'go-ethereum'
  'go-ethereum-git'
)
optdepends=(
  'mist: Mist dapp browser and Ethereum wallet.'
)
provides=(
    'geth'
    'abigen'
    'bootnode'
    'disasm'
    'evm'
    'gethrpctest'
    'rlpdump'
)
source=("${pkgname}::git+https://github.com/ethereum/go-ethereum.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgbase}"
  make all
}

package() {
  cd "$pkgbase"
  install -Dm755 build/bin/geth "$pkgdir"/usr/bin/geth
  install -Dm755 build/bin/geth "$pkgdir"/usr/bin/abigen
  install -Dm755 build/bin/geth "$pkgdir"/usr/bin/bootnode
  install -Dm755 build/bin/geth "$pkgdir"/usr/bin/disasm
  install -Dm755 build/bin/geth "$pkgdir"/usr/bin/evm
  install -Dm755 build/bin/geth "$pkgdir"/usr/bin/gethrpctest
  install -Dm755 build/bin/geth "$pkgdir"/usr/bin/rlpdump
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
