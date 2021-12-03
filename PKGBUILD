# Maintainer: theokonos

pkgname="pulse-sms"
pkgver="4.5.2"
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
    "33f3c6c0ac8cc26c688c7a04f9568f8aceae8c95627ce77f152ef428ab31d32439af6dcef077ff20ddc316a240e45f7e9e12e63324681f6b3838a5722805d384"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
    mv "${pkgdir}/opt/Pulse SMS/" "${pkgdir}/opt/${pkgname}"
    sed -i -e '3s/Pulse\ SMS/pulse-sms/' "${pkgdir}/usr/share/applications/pulse-sms.desktop"

    # install alias in /usr/bin
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
