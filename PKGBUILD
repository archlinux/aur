# Maintainer: tuxxx <nzb_tuxxx@proton.me>
# Contributor: Cybafunk Monkey <cybafunk-monkey@posteo.eu>

_pkgname=Sparrow
pkgname=sparrow-wallet
pkgver=1.8.6
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
sha256sums=('ba7f4568aa1c43b1ab10aec86eff3a79cfdf40d3f173924d4f02196e51407a78'
            '9795647b33618b4dc239c53225cd56f50ceda3f51c21a9e8c2169298945df063'
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
