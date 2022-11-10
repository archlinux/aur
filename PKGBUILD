# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
pkgname=cro-chain-desktop
pkgdesc='Crypto.com DeFi Desktop Wallet'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=1.3.4
pkgrel=1
arch=('x86_64')
makedepends=('yarn' 'nodejs<17')
provides=('cro-chain-desktop')
conflicts=('cro-chain-desktop-bin')
source=("${_pkgbin}-${pkgver}.tar.gz::https://github.com/crypto-com/chain-desktop-wallet/archive/refs/tags/v${pkgver}.tar.gz"
        "chain-desktop-wallet.desktop")
sha512sums=('5b51bdf52d5b25a329746668e6874267586703fa057c9502f0434ca00376ded7c1b358492f8335c5e0a52f05166e62b50740ee5a7f66ce58af3ead793926e6af'
            '396b7e061b2e701d10951f006a5ff0814bf71d1d513698d491c4e41748a165d6ceef020e455c889891cd445e6d3ecbaebe3d080420efd3607035a91ac857e065')

build() {
  cd ${_pkgbin}-${pkgver}

  yarn install
  yarn electron:build
}

package() {
  install -Dm644 "${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"

  cd ${_pkgbin}-${pkgver}

  install -dm755 "${pkgdir}/opt"
  cp -r "dist/linux-unpacked" "${pkgdir}/opt/${_pkgbin}"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgbin}/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"

  install -Dm644 "build/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgbin}.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
