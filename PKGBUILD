# Maintainer: fthiery fthiery@gmail.com

pkgname=keeweb-desktop
pkgver=0.5.1
pkgrel=4
pkgdesc="This webapp is a desktop password manager compatible with KeePass databases."
arch=('x86_64')
url="https://github.com/antelle/keeweb"
license=('MIT')
source=(
    "${url}/releases/download/v${pkgver}/KeeWeb.linux.x64.zip"
    "keeweb.desktop"
    "keeweb-desktop.install"
    "keeweb.xml"
)
sha256sums=(
    '4bed2321519ffbf9a35d1abe98cc7e3b4ea4c477fbb8a6ae2f2d4d8ccc040d46'
    'd6a5d6402d4c1c211da5f077b77422fc7da4dd4c7208bc77e7e29cf2f5427ca3'
    'b4b9f616079121402058a979e18fdcc0be89d42f287b30776da41862aebd9706'
    '7e1305d07e2b2ba4c7930283146bc89a64fd424f7ff15682e6cadf097862a294'
)
install=${pkgname}.install

package(){
    mkdir -p "${pkgdir}"/opt/${pkgname}
    cp --preserve=mode -r * "${pkgdir}"/opt/${pkgname}
    rm ${pkgdir}/opt/${pkgname}/KeeWeb.linux.x64.zip

    desktop-file-install -m 644 --dir "$pkgdir"/usr/share/applications/ keeweb.desktop

    for res in 128x128; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
        install -Dm755 "${pkgdir}/opt/${pkgname}/resources/app/icon.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/keeweb.png"
    done

    mkdir -p "${pkgdir}"/usr/bin
    echo -e "#!/bin/sh\n/opt/${pkgname}/KeeWeb \$1" > ${pkgdir}/usr/bin/KeeWeb
    chmod 755 ${pkgdir}/usr/bin/KeeWeb

    install -Dm644 keeweb.xml "$pkgdir"/usr/share/mime/packages/keeweb.xml
}
