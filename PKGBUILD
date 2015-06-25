# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=geth-git
pkgver=v0.9.26.r391.g22c7ce0
pkgrel=1
pkgdesc="Ethereum Go Client"
arch=('i686' 'x86_64')
url="https://github.com/ethereum/go-ethereum"
license=('MIT')
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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
