# Maintainer: whight

pkgname="pulse-sms"
pkgver="3.4.3"
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
    "7cbdc0941829366f9b52308c45e7b4927872a877a0c97ac79ce494ca5a8833c0bf00f98f0a4174e959640546a61e39f6bffea14b4561549ccd898d9c12b90154"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
	mv "${pkgdir}/opt/Pulse SMS/" "${pkgdir}/opt/${pkgname}"
	sed -i -e '4s/Pulse\ SMS/pulse-sms/' "${pkgdir}/usr/share/applications/pulse-sms.desktop"

    # install alias in /usr/bin
    mkdir "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
