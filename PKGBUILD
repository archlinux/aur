# Maintainer: whight

pkgname="pulse-sms"
pkgver="4.1.0"
pkgrel=1
pkgdesc="A native desktop implementation of Pulse"
arch=('x86_64')
url="https://messenger.klinkerapps.com/"
license=('APACHE')
depends=('libnotify' 'libxtst' 'nss' 'libxss')

source=(
    "https://github.com/klinker24/messenger-desktop/releases/download/v${pkgver}/pulse-sms-${pkgver}-amd64.deb"
)
sha512sums=(
    "fe24d52a6ebabf57374b891bfe15f6c2e8bf91c8e04b3b4d19df1c49384047393231fa11f25c2cb47ca29cd64f2a5d1ee8eb27a8d36632258651b52057bdec57"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
    mv "${pkgdir}/opt/Pulse SMS/" "${pkgdir}/opt/${pkgname}"
    sed -i -e '3s/Pulse\ SMS/pulse-sms/' "${pkgdir}/usr/share/applications/pulse-sms.desktop"

    # install alias in /usr/bin
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
