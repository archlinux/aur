# Maintainer: Santiago Lo Coco <santilococo.01 at gmail dot com>

_pkgname="onivim2"
pkgname=onivim2-bin
pkgver=0.5.7
pkgrel=1
pkgdesc="Native, lightweight modal code editor."
arch=('x86_64')
url="https://github.com/santilococo/oni2"
license=('MIT')
depends=("glu")
provides=('onivim2')
conflicts=('onivim2')
options=('!strip')
source=("${url}/releases/download/v${pkgver}/AppDir.tar"
        "${url}/releases/download/v${pkgver}/AppCache.tar")
sha256sums=('7858a23451b92e4e881b0a2b2ec953dbd9d146fbbc44d7c5cf31b717d12d32b3'
            '76bed45212235bb9f6c4a79d88684fdde3e2b70079ba06f9033113440155d322')

package() {
    cd "${srcdir}/_release/Onivim2.AppDir"

    install -dm755 "${pkgdir}/opt/${_pkgname}"
    install -dm755 "${pkgdir}/usr/bin/"
    install -Dm644 EULA.md "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm644 Onivim2.desktop "${pkgdir}/usr/share/applications/Onivim2.desktop"
    install -Dm644 Onivim2.png "${pkgdir}/usr/share/pixmaps/Onivim2.png"
    cp -Lr {AppRun,usr} "${pkgdir}/opt/onivim2"
    cp -r "${srcdir}/AppCache/camomile" "${pkgdir}/opt/onivim2/usr/share"
    ln -s /opt/onivim2/AppRun "${pkgdir}/usr/bin/Oni2"
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}"/opt/onivim2/AppRun \
        "${pkgdir}"/opt/onivim2/usr/bin/{Oni2*,node,rg} \
        "${pkgdir}"/opt/onivim2/usr/lib/*
}
