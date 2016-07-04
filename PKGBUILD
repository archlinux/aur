# Maintainer: David Parrish <daveparrish@gmail.com>
# Co-Maintainer: Afri 5chdn <aur@cach.co>

pkgname=geth-git
pkgver=1.4.9.r0.gb7e3dfc
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
provides=('geth')
source=("${pkgname}::git+https://github.com/ethereum/go-ethereum.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
