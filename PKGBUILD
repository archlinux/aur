# Maintainer: Dhananjay Tanpure <dtan13@pm.me>
# Contributor: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
# Contributor: Yegorius <yegorius at domic dot us>
pkgname=station
pkgver=2.0.9
pkgrel=1
pkgdesc='The one app to rule them all'
arch=('x86_64')
url='https://getstation.com/'
license=('MIT')
#depends=('gtk2' 'gconf' 'xdg-utils' 'libxtst' 'libxss' 'nss' 'alsa-lib' 'xdg-utils')
source=(
    "https://github.com/getstation/desktop-app/releases/download/v${pkgver}/Station-x86_64.AppImage"
)
sha256sums=('b0e63ac044ebee0b917f0537d0300a4ffc55f657c62618709e4ff6e91f59b327')

prepare() {
    chmod u+x ./Station-x86_64.AppImage
    ./Station-x86_64.AppImage --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/usr/lib"
    install -dm755 "${pkgdir}/usr/share"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"

    cp -a "${srcdir}/squashfs-root" "${pkgdir}/usr/lib/${pkgname}"
    find "${pkgdir}/usr/lib/${pkgname}" -type d -exec chmod 755 "{}" \;

    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    chmod -R 755 "${pkgdir}/usr/share/icons"

    sed -i -e 's/AppRun/station/' "${pkgdir}/usr/lib/${pkgname}/station-desktop-app.desktop"
    ln -s "/usr/lib/${pkgname}/station-desktop-app.desktop" "${pkgdir}/usr/share/applications/station-desktop-app.desktop"
    ln -s "/usr/lib/${pkgname}/station-desktop-app" "${pkgdir}/usr/bin/${pkgname}"
}
