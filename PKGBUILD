# Maintainer: Gregorio Aranda <tw.emmmm@gmail.com>
pkgname=mobirise
pkgver=6.0.1
pkgrel=2
pkgdesc="Website builder with drag and drop"
arch=('x86_64')
url="https://mobirise.com/"
license=('custom')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("https://download.mobirise.com/MobiriseSetup.deb"
        "mobirise.desktop")
sha256sums=('050175c940be4bc921b98d0f345097652bf50a3c1fa229a516fe95d06dd03e06'
            'SKIP')

package() {
    bsdtar -xf "${srcdir}/MobiriseSetup.deb"
    tar -xf data.tar.xz

    install -dm755 "${pkgdir}/opt"
    cp -r opt/Mobirise "${pkgdir}/opt/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/Mobirise/mobirise "${pkgdir}/usr/bin/mobirise"

    install -Dm644 "${srcdir}/mobirise.desktop" "${pkgdir}/usr/share/applications/mobirise.desktop"

    if [[ -f usr/share/icons/hicolor/256x256/apps/mobirise.png ]]; then
        install -Dm644 usr/share/icons/hicolor/256x256/apps/mobirise.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/mobirise.png"
    fi
}
