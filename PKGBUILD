# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname=cardano-addresses
pkgver=3.2.0
pkgrel=1
pkgdesc='Addresses and mnemonic manipulation & derivations for Cardano blockchain platform'
license=('Apache')
arch=('any')
url='https://github.com/input-output-hk/cardano-addresses'
makedepends=('cabal-install-bin' 'ghc-8.6=8.6.5')
_ghc_version="8.6.5"
source=("https://github.com/input-output-hk/${pkgname}/archive/${pkgver}.zip"
        "arch-ghc.patch")
sha256sums=(
        "c8c03e1a9cfc872683b30236fe7c26b8a6edb843902934ade8e1e006bb6d7e45"
        "948405ebe0abbf758bc038926fc00494e7ced7be2bd607af7107b107991ee637")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../arch-ghc.patch
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
