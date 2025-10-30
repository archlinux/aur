# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname='nunchuk-desktop-appimage'
_pkgname='nunchuk-desktop'
__pkgname='nunchuk-linux'
___pkgname='nunchuk'
pkgver=1.9.54
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
source=("https://github.com/nunchuk-io/$_pkgname/releases/download/$pkgver/$__pkgname-v$pkgver.zip")
sha256sums=('d7d68901fe398e6548033b9ca7b3d8b868d803b013a0b75cc342b1326b276d67')

#validpgpkeys=('8C8ECD3F660CA53CD878792A6E38A462ED2EF525') # Ta Tat Tai (Nunchuk binary release signing key) <tatattai@gmail.com>

prepare() {
    cd "${srcdir}"
    7z x "${srcdir}/$__pkgname-v${pkgver}.AppImage" $___pkgname.desktop $___pkgname-qt.png
}

package() {
    cd "${srcdir}"
    install -Dm755 "$__pkgname-v${pkgver}.AppImage"    "${pkgdir}/opt/$_pkgname/$__pkgname.AppImage"
    install -Dm644 "$___pkgname.desktop"               "${pkgdir}/usr/share/applications/$___pkgname.desktop"
    install -Dm644 "$___pkgname-qt.png"                "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$___pkgname-qt.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$_pkgname/$__pkgname.AppImage"         "${pkgdir}/usr/bin/$___pkgname-qt"
}
