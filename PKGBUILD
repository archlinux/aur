# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname=cardano-addresses
pkgver=3.4.0
pkgrel=1
pkgdesc='Addresses and mnemonic manipulation & derivations for Cardano blockchain platform'
license=('Apache')
arch=('any')
url='https://github.com/input-output-hk/cardano-addresses'
makedepends=('cabal-install-bin' 'ghc8.6-bin=8.6.5')
_ghc_version="8.6.5"
source=("https://github.com/input-output-hk/${pkgname}/archive/${pkgver}.zip")
sha256sums=("16e7e90fe91796ba8a1c95ae5e542f87719ed4fac8178e9d4b681369a49495c3")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cabal configure
  cabal clean
  cabal update
  cabal build all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m0755 \
    "dist-newstyle/build/x86_64-linux/ghc-${_ghc_version}/${pkgname}-cli-${pkgver}/x/cardano-address/build/cardano-address/cardano-address" \
    "${pkgdir}/usr/bin/cardano-address"
}
