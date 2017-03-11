# Maintainer: Michael Egger <michael dot egger at tsn dot at>
# Contributor: TrekDev <trekdev0 at gmail dot com>
pkgname=truffle-git
pkgver=536.2ff5f1a
pkgrel=1
pkgdesc='A development framework for Ethereum'
url='https://github.com/ConsenSys/truffle'
arch=('any')
license=('MIT')
source=("truffle::git+https://github.com/ConsenSys/truffle.git")
makedepends=('npm')
depends=('nodejs')
sha256sums=('SKIP')
provides=('truffle')
optdepends=('mocha: testing support'
            'testrpc: contract deployment'
            'geth: contract deployment')

pkgver() {
  cd "${srcdir}/truffle"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/truffle"
  # speed up npm install
  npm set progress=false
  npm install -g --prefix "$pkgdir/usr"
  install -D -m644 "${srcdir}/truffle/LICENSE" "${pkgdir}/usr/share/licenses/truffle/LICENSE"
}
