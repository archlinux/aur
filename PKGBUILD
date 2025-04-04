# Maintainer: Gregorio Aranda <tw.emmmm@gmail.com>

pkgname=mobirise
pkgver=6.0.1
pkgrel=1
pkgdesc="Website builder with drag and drop"
arch=('x86_64')
url="https://mobirise.com/"
license=('custom')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("https://download.mobirise.com/MobiriseSetup.deb")
sha256sums=('050175c940be4bc921b98d0f345097652bf50a3c1fa229a516fe95d06dd03e06')

package() {
    bsdtar -xf "${srcdir}/MobiriseSetup.deb"

    # Instalar Mobirise en /opt
    install -dm755 "${pkgdir}/opt"
    cp -r opt/Mobirise "${pkgdir}/opt/"

    # Crear enlace simbólico en /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/Mobirise/mobirise "${pkgdir}/usr/bin/mobirise"

    # Instalar el archivo .desktop
    if [[ -f usr/share/applications/mobirise.desktop ]]; then
        install -Dm644 usr/share/applications/mobirise.desktop "${pkgdir}/usr/share/applications/mobirise.desktop"
    fi

    # Instalar iconos
    if [[ -d usr/share/icons ]]; then
        cp -r usr/share/icons "${pkgdir}/usr/share/"
    fi
}
