# Maintainer: Santiago Lo Coco <santilococo.01 at gmail dot com>

_pkgname="onivim2"
pkgname=onivim2-bin
pkgver=0.5.7
pkgrel=2
pkgdesc="Native, lightweight modal code editor."
arch=('x86_64')
url="https://github.com/santilococo/oni2"
license=('MIT')
depends=("glu" "python" "gtk3" "nodejs" "libxkbfile" "libjpeg6-turbo")
makedepends=("glib2" "acl" "libxcursor" "libxrandr" "libxi" "libxinerama" 
             "fontconfig" "ncurses" "harfbuzz")
provides=('onivim2')
conflicts=('onivim2')
options=('!strip')
source=("${url}/releases/download/v${pkgver}/AppDir.tar"
        "${url}/releases/download/v${pkgver}/AppCache.tar"
        "https://raw.githubusercontent.com/santilococo/oni2/master/LICENSE.md")
sha256sums=('fbc8a7514abf272f2976dab349b65c5b9ab99715b51cd88e95e0c8c9e190d511'
            '5664c11d7d8a0b216926144e9218bc5c3255a0f4934ae7eb58797ff2775db2cb'
            '32edcecd2c392702a06ee4490d839d8a6da786deb6ca0430f16655e071f0760a')

package() {
    cd "${srcdir}/_release/Onivim2.AppDir"

    install -dm755 "${pkgdir}/opt/${_pkgname}"
    install -dm755 "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 Onivim2.desktop "${pkgdir}/usr/share/applications/Onivim2.desktop"
    install -Dm644 Onivim2.png "${pkgdir}/usr/share/pixmaps/Onivim2.png"
    cp -Lr {AppRun,usr} "${pkgdir}/opt/${_pkgname}"
    cp -r "${srcdir}/AppCache/camomile" "${pkgdir}/opt/${_pkgname}/usr/share"
    ln -s /opt/onivim2/AppRun "${pkgdir}/usr/bin/Oni2"
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}"/opt/onivim2/AppRun \
        "${pkgdir}"/opt/onivim2/usr/bin/{Oni2*,node,rg} \
        "${pkgdir}"/opt/onivim2/usr/lib/*
}
