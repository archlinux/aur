# Maintainer: theokonos

pkgname="pulse-sms"
pkgver="4.4.1"
pkgrel=1
pkgdesc="A native desktop implementation of Pulse"
arch=('x86_64')
url="https://messenger.klinkerapps.com/"
license=('APACHE')
depends=('libnotify' 'libxtst' 'nss' 'libxss')

source=(
    "https://github.com/maplemedia/pulse-sms-desktop/releases/download/v${pkgver}/pulse-sms-${pkgver}-amd64.deb"
)
sha512sums=(
    "d2a06269a1f212d97c90935091313da54b64d6e4c54715468da6b1bf7ff01c512f8f519224fc8f9aa2a502fd65c7b8a18ad79557327ab935e6f70e347225a2ca"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
    mv "${pkgdir}/opt/Pulse SMS/" "${pkgdir}/opt/${pkgname}"
    sed -i -e '3s/Pulse\ SMS/pulse-sms/' "${pkgdir}/usr/share/applications/pulse-sms.desktop"

    # install alias in /usr/bin
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
