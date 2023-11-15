# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=kiwiirc
pkgname="${_pkgname}-server-bin"
pkgver=1.7.1
pkgrel=2
pkgdesc="KiwiIRC server"
arch=('armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://kiwiirc.com/"
_ghurl="https://github.com/kiwiirc/kiwiirc"
license=('Apache')
provides=("${pkgname%-server-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
install="${pkgname%-bin}.install"
source_armv6h=("${pkgname%-bin}-${pkgver}-armv6h.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-2_linux_armel.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-2_linux_armhf.deb")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-2_linux_arm64.deb")
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-2_linux_i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-2_linux_amd64.deb")
source=("${pkgname%-bin}.install")
sha256sums=('b9aa8bb14dcdbb9dce07716df7b22e9fe9ac5ff29600be6117b1b49f22ceba9e')
sha256sums_armv6h=('294fc7f476ae894acde641d812699bf3fec2bb61f9c28aa71cf13c09602debce')
sha256sums_armv7h=('3c2ca17a34d26a20fd32ff69d49d3f910dea9ed2babe209b27463c8a825e7731')
sha256sums_aarch64=('8ffc0dfe6a65d7f57743490aa744e3af52988fa16a31037ddec3505232a8a306')
sha256sums_i686=('a09e68c00bc25c208eb298f384ffd57597e96dd9d10a3e41ae621f11b9e1231f')
sha256sums_x86_64=('76a33fa476318c827f5dfcb2fbbf6b4c25aa48dc76840420c09e47231f614578')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    find "${srcdir}" -type d -perm 775 -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/etc/init.d/${_pkgname}" -t "${pkgdir}/etc/init.d"
    install -Dm644 "${srcdir}/etc/${_pkgname}/client.example.json" "${pkgdir}/etc/${_pkgname}/client.json"
    install -Dm644 "${srcdir}/etc/${_pkgname}/config.example.conf" "${pkgdir}/etc/${_pkgname}/config.conf"
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/doc/${_pkgname}/changelog.gz" -t "${pkgdir}/usr/share/doc"
    cp -r "${srcdir}/usr/share/${_pkgname}" "${pkgdir}/usr/share"
}