# Maintainer: MagicTerm <magicterm@users.noreply.github.com>
pkgname=magicterm-bin
pkgver=0.3.9
pkgrel=1
pkgdesc="Cross-platform SSH/SFTP client with E2E encryption"
arch=('x86_64')
url="https://github.com/D3FVLT/MagicTerm"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'libsecret')
provides=('magicterm')
conflicts=('magicterm')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/D3FVLT/MagicTerm/releases/download/v${pkgver}/MagicTerm-${pkgver}-x86_64.AppImage")
sha256sums=('SKIP')
prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}
package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r squashfs-root/* "${pkgdir}/opt/${pkgname}/"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/magic-term" "${pkgdir}/usr/bin/magicterm"
}
