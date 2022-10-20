# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
pkgname=cro-chain-desktop
pkgdesc='Crypto.com DeFi Desktop Wallet'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=1.3.2
pkgrel=2
arch=('x86_64')
makedepends=('git' 'yarn' 'nodejs<17')
provides=('cro-chain-desktop')
conflicts=('cro-chain-desktop-bin')
source=("${_pkgbin}-${pkgver}.tar.gz::https://github.com/crypto-com/chain-desktop-wallet/archive/refs/tags/v${pkgver}.tar.gz"
        "chain-desktop-wallet.desktop")
sha512sums=('5e185aaa3795a6d904814a035fdc5de84b7130040d386a790165e69b03fbb79d92c9ea457a168363367c5e4fef5f2cf4416070b5bb3815e5f514f897d1924409'
            '969ee0790310790bba17d35988270ecb16b3709ff1b897ce0e9e10f612a82e687e6212343c64074839029637e895586374e4ece1219e77addaa7d20e93678924')

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
