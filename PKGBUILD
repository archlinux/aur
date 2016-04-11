# Maintainer: TrekDev <trekdev0 at gmail dot com>
pkgname=truffle
pkgver=1.0.0
pkgrel=1
pkgdesc='A development framework for Ethereum'
url='https://github.com/ConsenSys/truffle'
arch=('any')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ConsenSys/truffle/archive/v1.0.0.tar.gz")
makedepends=('npm')
depends=('nodejs')
conflicts=('truffle-git')
sha256sums=('93bcb6091d119ed2d657ecfb33ba0a949415ed6e5bf22e2d731e26deb968163d')
provides=('truffle')
optdepends=('mocha: testing support'
            'testrpc: contract deployment'
            'geth: contract deployment')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -Rf .git*
  npm install

  mkdir -p "${pkgdir}/usr/lib/"
  cp -R "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/lib/"
  mv "${pkgdir}/usr/lib/${pkgname}-${pkgver}" "${pkgdir}/usr/lib/truffle"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/truffle/cli.js" "${pkgdir}/usr/bin/truffle"

  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
