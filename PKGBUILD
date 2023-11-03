# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: neo.shadowsocks<neo.shadowsocks AT gmx.com>
# Contributor: Kars Wang <jaklsy g-mail>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>
pkgname=lantern-bin
pkgver=7.6.2
pkgrel=1
pkgdesc='Free desktop application that delivers fast, reliable and secure access to the open Internet. (Stable Channel, binary)'
arch=('x86_64')
url='https://getlantern.org'
_githuburl="https://github.com/getlantern/lantern"
license=('Apache')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-headless")
provides=("${pkgname%-bin}")
depends=(
    'bash'
    'gtk3'
    'glib2'
    'glibc'
    'gcc-libs'
    'libayatana-appindicator'
)
options=(
    '!emptydirs'
    '!strip'
    '!docs'
)
source=(
    "${pkgname}-${pkgver}.deb::https://github.com/getlantern/lantern-binaries/raw/main/${pkgname%-bin}-installer-64-bit.deb"
    "${pkgname%-bin}.service"
)
sha256sums=('e2579538e157b23ea0da8ed1d2e256baaa96cfd13fba149271327285fa63d8db'
            'fdece37945be10c00210bbde7b4058c356ef1df0554bd963fcddd12990ff930b')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}-binary" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}.sh" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}.yaml" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/lib/${pkgname%-bin}/.packaged-${pkgname%-bin}.yaml" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/user"
}