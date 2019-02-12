# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
pkgname=wasabi-wallet-bin
_pkgname=wasabi-wallet
pkgver=1.1.1
pkgrel=1
pkgdesc="Privacy focused, ZeroLink compliant Bitcoin wallet"
arch=('x86_64')
options=(!strip staticlibs)
url="https://wasabiwallet.io/"
license=('MIT')
depends=('curl' 'fontconfig')
provides=('wasabi-wallet')
conflicts=('wasabi-wallet')
source=(
    "https://github.com/zkSNACKs/WalletWasabi/releases/download/v${pkgver}/WasabiLinux-${pkgver}.tar.gz"
    "https://github.com/zkSNACKs/WalletWasabi/releases/download/v${pkgver}/WasabiLinux-${pkgver}.tar.gz.asc"
    "wasabi.desktop"
    "wasabi.png"
    "LICENSE.md"
)
sha256sums=('5ed68d9c3946cc2e7d27d24a22b694ec3b25551dd262d46cb4817ebf45e76b3d'
            'SKIP'
            '4d633e1b310eb2666e314b39a336031facd164f227a2ad595e8a0b8ba4b962ee'
            '861064b9019ac8d0294d46c298dd2f552e078dc2d0f2b52ffb1e9e09a20278a3'
            '986ee8b1139dbe8405801baf1081d075b53728fd5c57dd31885cf4ddbe5d8f68')
# Run gpg --keyserver pool.sks-keyservers.net --recv-keys B4B72266C47E075E
validpgpkeys=('21D7CA45565DBCCEBE45115DB4B72266C47E075E')

package() {
    install -d -m755 "${pkgdir}/opt/"
    cp -a "$srcdir/WasabiLinux-${pkgver}" "${pkgdir}/opt/${_pkgname}"
    chown -R root:root "$pkgdir/opt/${_pkgname}"
    install -d -m755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${_pkgname}/wassabee" "${pkgdir}/usr/bin/${_pkgname}"

    # Install desktop launcher.
    install -Dm644 wasabi.desktop "${pkgdir}/usr/share/applications/wasabi.desktop"
    install -Dm644 wasabi.png "${pkgdir}/usr/share/pixmaps/wasabi.png"

    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
