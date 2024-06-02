# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname='nunchuk-desktop-appimage'
_pkgname='nunchuk-desktop'
__pkgname='nunchuk-linux'
___pkgname='nunchuk'
pkgver=1.9.34
pkgrel=1
pkgdesc="Desktop bitcoin wallet with multisig, hardware, nfc and air-gapped key support"
arch=('x86_64')
url="https://nunchuk.io/"
license=('GPL3')
depends=('hicolor-icon-theme' 'zlib' 'fuse' 'gtk3')
makedepends=('p7zip')
optdepends=('bitbox-udev: Udev rules for Bitbox hardware wallet support'
            'keepkey-udev: Udev rules for Keepkey hardware wallet support'
#            'blockstream-jade-udev: Udev rules for Blockstream Jade hardware wallet support'
            'ledger-udev: Udev rules for Ledger hardware wallet support'
            'python-ckcc-protocol: Udev rules for Coinkite Coldcard hardware wallet support'
            'trezor-udev: Udev rules for Trezor hardware wallet support')
provides=('nunchuk-qt')
options=('!strip' '!debug')
source=("https://github.com/nunchuk-io/$_pkgname/releases/download/$pkgver/$__pkgname-v$pkgver.zip")

sha256sums=('c518b4d0b178fa09460005c9a1e5af58a33d8764d69235055ec947e866865ea7')

#validpgpkeys=('8C8ECD3F660CA53CD878792A6E38A462ED2EF525') # Ta Tat Tai (Nunchuk binary release signing key) <tatattai@gmail.com>

prepare() {
    cd "${srcdir}"
    7z x "${srcdir}/$__pkgname-${pkgver}/$__pkgname-${pkgver}.AppImage" $___pkgname-qt.desktop $___pkgname-qt.png
}

package() {
    cd "${srcdir}"
    install -Dm755 "$__pkgname-${pkgver}/$__pkgname-${pkgver}.AppImage" "${pkgdir}/opt/$_pkgname/$__pkgname-${pkgver}.AppImage"
    install -Dm644 "$___pkgname-qt.desktop"                             "${pkgdir}/usr/share/applications/$___pkgname-qt.desktop"
    install -Dm644 "$___pkgname-qt.png"                                 "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$___pkgname-qt.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$_pkgname/$__pkgname-${pkgver}.AppImage"                "${pkgdir}/usr/bin/$___pkgname-qt"
}
