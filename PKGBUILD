# Maintainer: whight

pkgname="pulse-sms"
pkgver="3.4.4"
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
    "c2063ab2d9be635b0bc4f6e93b28be28275d53184d7b733a7f3b3bc526deb21ca575f1347d139a9fae4808f0f529afa591aca0a42b2374fdb00ec37767482019"
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
