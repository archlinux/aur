# Maintainer: fthiery fthiery@gmail.com

pkgname=keeweb-desktop
pkgver=0.5.1
pkgrel=1
pkgdesc="This webapp is a desktop password manager compatible with KeePass databases."
arch=('x86_64')
url="https://github.com/antelle/keeweb"
makedepends=('imagemagick')
license=('MIT')
source=(
    "${url}/releases/download/v${pkgver}/KeeWeb.linux.x64.zip"
    "keeweb.desktop"
    "keeweb-desktop.install"
)
sha256sums=(
    '4bed2321519ffbf9a35d1abe98cc7e3b4ea4c477fbb8a6ae2f2d4d8ccc040d46'
	'8fd3b677f5d9fd8c2992004cc01fb5629939c94ca81b43d347f8e57ac6c0a70b'
    '78c88e74b4e951d52f328656c6b12dbb1da5a73019a9f2d230be8d0cdfdcfda8'
)
install=${pkgname}.install

package(){
    mkdir -p "${pkgdir}"/usr/share/${pkgname}
    cp --preserve=mode -r * "${pkgdir}"/usr/share/${pkgname}
    rm ${pkgdir}/usr/share/${pkgname}/KeeWeb.linux.x64.zip

    for res in 128x128 16x16 256x256 32x32 48x48; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
        convert -resize ${res} -depth 8 "${pkgdir}/usr/share/${pkgname}/resources/app/icon.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/keeweb.png"
    done

    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "keeweb.desktop" "${pkgdir}/usr/share/applications/keeweb.desktop"

    mkdir -p "${pkgdir}"/usr/bin
    echo -e "#!/bin/sh\n/usr/share/${pkgname}/KeeWeb" > ${pkgdir}/usr/bin/KeeWeb
    chmod 755 ${pkgdir}/usr/bin/KeeWeb
}
