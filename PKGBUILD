# Maintainer: Uthopik <josearrillaga@ik.me>
pkgname=astronex-bin
pkgver=1.2.3
pkgrel=3
pkgdesc="Appimage version in python2 of Astronex. An astrology program for calculating and drawing charts according to the API Method. Used in Huber method"
arch=('x86_64')
url="https://github.com/Uthopik/astronex-appimage"
license=('GPL-3.0-only') 
depends=('zlib' 'hicolor-icon-theme' 'fuse2') 
options=('!strip')

# Usamos variables para facilitar futuras actualizaciones
_appimage="astronex-appimage-${pkgver}-${CARCH}.AppImage"

source=("${_appimage}::${url}/releases/download/v1.2/${_appimage}"
        "astronex.desktop"
        "astronex.svg")

# RECUERDA: Genera estos hashes con 'sha256sum' para cada archivo
sha256sums=('137252f075af779034e1da6242f4921389a1b925e6af5c013bccc46f5d9432cc'
            'da62d673e47b995ea4fa7d9ee1600fd5ea953b440388ad278a2b4d07362273a1'
            '5989875f29c8fabdccfc1be4c488a314e3154af9f539ab8e579b17dc52ec7145')

package() {
    # 1. Instalar el binario (AppImage) con permisos de ejecución
    # Usamos la variable para no escribir el nombre largo otra vez
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/usr/bin/astronex"

    # 2. Instalar el lanzador .desktop
    install -Dm644 "${srcdir}/astronex.desktop" "${pkgdir}/usr/share/applications/astronex.desktop"

    # 3. Instalar el icono SVG
    install -Dm644 "${srcdir}/astronex.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/astronex.svg"
}