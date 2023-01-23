# Maintainer: theokonos

pkgname="pulse-sms"
pkgver="4.5.3"
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
    "bf353739c010b8bde06ae016f527b62e454ee31b4bd37882bce267b3049008e5622073b32d4ce9a2ed51de7f7a0437e21831e9b5baa9d2d76225a27286afc3da"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
    mv "${pkgdir}/opt/Pulse SMS/" "${pkgdir}/opt/${pkgname}"
    sed -i -e '3s/Pulse\ SMS/pulse-sms/' "${pkgdir}/usr/share/applications/pulse-sms.desktop"

    # install alias in /usr/bin
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
