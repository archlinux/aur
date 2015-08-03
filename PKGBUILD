# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=geth-git
pkgver=v0.9.39.r48.gdb988a4
pkgrel=1
pkgdesc="Ethereum Go Client"
arch=('i686' 'x86_64')
url="https://github.com/ethereum/go-ethereum"
license=('LGPL3' 'GPL3')
makedepends=('go' 'gmp')
source=("${pkgname}::git+https://github.com/ethereum/go-ethereum.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgbase}"
  make
}

package() {
  cd "$pkgbase"
  install -Dm755 build/bin/geth "$pkgdir"/usr/bin/geth
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
