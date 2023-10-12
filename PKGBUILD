# Maintainer: Sahil Gupte <ovenoboyo@gmail.com>

_pkgname=moosync
pkgname=moosync-bin
pkgver=10.1.2
pkgrel=1
pkgdesc='A simple music player'
arch=('any')
url='https://github.com/Moosync/Moosync'
license=('GPL3')
provides=("${_pkgname}")
depends=('electron' 'alsa-lib')
source=("${_pkgname}-${pkgver}-prebuilt.tar::https://github.com/Moosync/Moosync/releases/download/v${pkgver}/Moosync-${pkgver}-linux-x64.pacman" moosync moosync.desktop)
sha256sums=('003a64be6efa8049d86b388b444ee6037d7cf644dab53f16d890001bc0371312'
            '4ed86e1f5a969e6c03fe8efb66ec136c2f37b21010a37eacd414675b784b1058'
            '4b63fa17717239db8a87ebeae1fdd96c5318b71d7d851d6c5a4f337793d3fecd')
conflicts=("${_pkgname}")
_sourcedirectory="Moosync-$pkgver"

package() {
    install -d opt "${pkgdir}/opt"
    install -d usr "${pkgdir}/usr"

    find opt -type f -exec install -Dm 755 "{}" "${pkgdir}/{}" \;
    find usr -type f -exec install -Dm 755 "{}" "${pkgdir}/{}" \;

    install -d "${pkgdir}/usr/bin"
    install "moosync" "${pkgdir}/usr/bin/moosync"

    # Place desktop entry and icons
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "moosync.desktop"
}
