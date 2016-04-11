# Maintainer: TrekDev <trekdev0 at gmail dot com>
pkgname=truffle-git
pkgver=1.0.0
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

package() {
  cd "${srcdir}/truffle"
  rm -Rf .git*
  npm install

  mkdir -p "${pkgdir}/usr/lib/"
  cp -R "${srcdir}/truffle" "${pkgdir}/usr/lib/"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/truffle/cli.js" "${pkgdir}/usr/bin/truffle"

  install -D -m644 "${srcdir}/truffle/LICENSE" "${pkgdir}/usr/share/licenses/truffle/LICENSE"
}
