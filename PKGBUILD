# Maintainer: whight

pkgname="pulse-sms"
pkgver="3.3.1"
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
    "eaa0a1b07e86e19ea7cfac19656857e5ba6df3b4293c02be20232de3e1033fcd501af311b6b9e77d6d221a4e4fd76b5f5b28cc66bd35fe00adc1d754d5964d7b"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
	mv "${pkgdir}/opt/Pulse SMS/" "${pkgdir}/opt/${pkgname}"
	sed -i -e '4s/Pulse\ SMS/pulse-sms/' "${pkgdir}/usr/share/applications/pulse-sms.desktop"

    # install alias in /usr/bin
    mkdir "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
