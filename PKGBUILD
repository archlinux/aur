# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

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
sha256sums=('298bf2e27df94a3018be0366a70c82f41e59c7b018cb43448d4ed516755ba818'
            '7009fd05c2c1063632a72a54be29be78e9ef9b62238ae55c805a51227eb7cf78'
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
