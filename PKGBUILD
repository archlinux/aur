# Maintainer: David Parrish <daveparrish@gmail.com>
# Co-Maintainer: Afri 5chdn <aur@cach.co>

pkgname=geth-git
pkgver=v0.9.39.r882.g18580e1
pkgrel=1
pkgdesc="Ethereum Go Client"
arch=('i686' 'x86_64')
url="https://github.com/ethereum/go-ethereum"
license=('LGPL3' 'GPL3')
makedepends=('go' 'gmp')
optdepends=('mist: Graphical Ethereum wallet and DApps browser.')
conflicts=(
  'geth-git'
  'go-ethereum'
  'go-ethereum-git'
)
provides=('geth')
source=("${pkgname}::git+https://github.com/ethereum/go-ethereum.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git checkout -q develop
  git pull -q
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgbase}"
  git checkout develop
  git pull
  make
}

package() {
  cd "$pkgbase"
  install -Dm755 build/bin/geth "$pkgdir"/usr/bin/geth
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
