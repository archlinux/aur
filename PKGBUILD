# Maintainer: tuxxx <nzb_tuxxx@proton.me>
# Contributor: Cybafunk Monkey <cybafunk-monkey@posteo.eu>

_pkgname=Sparrow
pkgname=sparrow-wallet
pkgver=2.1.3
pkgrel=1
pkgdesc="Desktop Bitcoin Wallet focused on security and privacy. Free and open source"
arch=('x86_64')
url="https://sparrowwallet.com/"
license=('Apache-2.0')
depends=('hicolor-icon-theme' 'alsa-lib' 'libxtst' 'libxrender' 'freetype2' 'libxcrypt-compat')
makedepends=('gendesk')
validpgpkeys=('D4D0D3202FC06849A257B38DE94618334C674B40')
source=(
  "https://github.com/sparrowwallet/sparrow/releases/download/$pkgver/sparrow-$pkgver-$CARCH.tar.gz"
  "https://github.com/sparrowwallet/sparrow/releases/download/$pkgver/sparrow-$pkgver-manifest.txt"{,.asc})
sha256sums=('15babdf8698a2f8d109f194ab5b5582e265155b92763e605ffdae5dff72e2e70'
            '63b03fabc56a4c7a096cb90b31463189809bbe10847d3412fb86796fdc82cbe9'
            'SKIP')
prepare() {
    sha256sum -c --ignore-missing sparrow-$pkgver-manifest.txt
    gendesk -q -f -n --pkgname "${_pkgname}" --pkgdesc "$pkgdesc" --name=$_pkgname --exec="/usr/bin/${_pkgname}" --categories="Utility;Finance"
}

package() {
    install -dm755 "${pkgdir}"/opt/${pkgname}/lib/
    install -dm755 "${pkgdir}"/usr/bin/

    cp -a "${srcdir}"/${_pkgname}/bin "${pkgdir}"/opt/${pkgname}/
    cp -a "${srcdir}"/${_pkgname}/lib/app "${pkgdir}"/opt/${pkgname}/lib/
    cp -a "${srcdir}"/${_pkgname}/lib/runtime "${pkgdir}"/opt/${pkgname}/lib/
    cp -a "${srcdir}"/${_pkgname}/lib/*.so "${pkgdir}"/opt/${pkgname}/lib/

    install -Dm644 "${srcdir}"/${_pkgname}/lib/${_pkgname}.png -t "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/
    install -Dm644 "${srcdir}"/${_pkgname}.desktop "${pkgdir}"/usr/share/applications/${_pkgname,,}-wallet.desktop
    ln -s "/opt/$pkgname/bin/${_pkgname}" "${pkgdir}"/usr/bin/
}
