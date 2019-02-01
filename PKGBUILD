# Maintainer: whight

pkgname="pulse-sms"
pkgver="3.2.1"
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
    "f4ddcc0e4ac9bb8fc9e3aedccb80f8a2752c020aea9acfbefee472f433b3421ef2bc15b907c2f1f082c25f9e80decec2328bf79c4211b0c337561ae6c1b05d2f"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
	mv "${pkgdir}/opt/Pulse SMS/" "${pkgdir}/opt/${pkgname}"
	sed -i -e '4s/Pulse\ SMS/pulse-sms/' "${pkgdir}/usr/share/applications/pulse-sms.desktop"

    # install alias in /usr/bin
    mkdir "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
