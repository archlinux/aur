# Maintainer: whight

pkgname="pulse-sms"
pkgver="3.5.0"
pkgrel=1
pkgdesc="A native desktop implementation of Pulse"
arch=('x86_64')
url="https://messenger.klinkerapps.com/"
license=('APACHE')
depends=('gconf' 'libnotify' 'libxtst' 'nss' 'libxss')

source=(
    "https://github.com/klinker24/messenger-desktop/releases/download/v${pkgver}/pulse-sms-${pkgver}-amd64.deb"
)
sha512sums=(
    "12d75137c126def626e671fe59b3401718b74d5b95dc655644913d7adc261682b226646e8f29d68ddbc4dfeb049606bcb5aa14c23ef65133305ee09057c9580a"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
    mv "${pkgdir}/opt/Pulse SMS/" "${pkgdir}/opt/${pkgname}"
    chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"
    sed -i -e '4s/Pulse\ SMS/pulse-sms/' "${pkgdir}/usr/share/applications/pulse-sms.desktop"

    # install alias in /usr/bin
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
