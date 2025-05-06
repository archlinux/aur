# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname='nunchuk-desktop-appimage'
_pkgname='nunchuk-desktop'
__pkgname='nunchuk-linux'
___pkgname='nunchuk'
pkgver=1.9.46
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
options=('!strip')
source=("https://github.com/nunchuk-io/$_pkgname/releases/download/$pkgver/$__pkgname-v$pkgver-$arch.zip")

sha256sums=('0d01ff8e59a14a5fb7d4cf91cbe0069ec43314b463dac01eb1f41ad26abb63ee')

#validpgpkeys=('8C8ECD3F660CA53CD878792A6E38A462ED2EF525') # Ta Tat Tai (Nunchuk binary release signing key) <tatattai@gmail.com>

prepare() {
    cd "${srcdir}"
    7z x "${srcdir}/$__pkgname-v${pkgver}-${arch}/$__pkgname-v${pkgver}-${arch}.AppImage" $___pkgname-qt.desktop $___pkgname-qt.png
}

package() {
    cd "${srcdir}"
    install -Dm755 "$__pkgname-v${pkgver}-${arch}/$__pkgname-v${pkgver}-${arch}.AppImage" "${pkgdir}/opt/$_pkgname/$__pkgname.AppImage"
    install -Dm644 "$___pkgname-qt.desktop"                             "${pkgdir}/usr/share/applications/$___pkgname-qt.desktop"
    install -Dm644 "$___pkgname-qt.png"                                 "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$___pkgname-qt.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$_pkgname/$__pkgname.AppImage"                "${pkgdir}/usr/bin/$___pkgname-qt"
}
