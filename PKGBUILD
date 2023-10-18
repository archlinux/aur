# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: neo.shadowsocks<neo.shadowsocks AT gmx.com>
# Contributor: Kars Wang <jaklsy g-mail>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>
pkgname=lantern-bin
pkgver=7.4.0
pkgrel=2
pkgdesc='Free desktop application that delivers fast, reliable and secure access to the open Internet. (Stable Channel, binary)'
arch=('i686' 'x86_64')
url='https://getlantern.org'
_githuburl="https://github.com/getlantern/lantern"
license=('Apache')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-headless")
provides=("${pkgname%-bin}")
depends=('libappindicator-gtk3' 'bash' 'gtk3' 'glib2' 'glibc' 'gcc-libs')
options=('!emptydirs' '!strip' '!docs')
source=("${pkgname%-bin}.service")
source_i686=("${pkgname}-${pkgver}-i686.deb::https://github.com/getlantern/lantern-binaries/raw/main/${pkgname%-bin}-installer-32-bit.deb")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/getlantern/lantern-binaries/raw/main/${pkgname%-bin}-installer-64-bit.deb")
sha256sums=('fdece37945be10c00210bbde7b4058c356ef1df0554bd963fcddd12990ff930b')
sha256sums_i686=('0488927484396a7912a4b0d64b8209f3e01b87e47c3665a8c55508014650e4b8')
sha256sums_x86_64=('7996c1707b9b8550203fb1037960312fbab266b6e439684f3f1d6aaee27e5e4d')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}-binary" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}.sh" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}.yaml" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/lib/${pkgname%-bin}/.packaged-${pkgname%-bin}.yaml" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/user"
}