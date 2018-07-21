# Maintainer: Michiru Saito <urihcim at gmail dot com>
pkgname=gurashot
pkgver=1.4.3
pkgrel=1
pkgdesc="ID photo creation tool"
arch=('i686' 'x86_64')
url='http://app.gura-lang.org/gurashot/'
license=('unknown')
install=$pkgname.install
depends=('gura' 'desktop-file-utils')
makedepends=('unzip')
source=("https://github.com/gura-app/gurashot/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip"
        "${pkgname}.sh"
        "${pkgname}.png"
        "${pkgname}.desktop")
noextract=("${pkgname}-${pkgver}.zip")
md5sums=('b46f2db07106ddf8e153ddc5773b8058'
         '533a162f0d6018dec234db19cb1663a4'
         '8ca0a8703eeb5c85171502028668974a'
         'e7ad0893e4ccc2edd4d2679ed025c91e')

prepare() {
    sed -e "s/%PKGVER%/${pkgver}/" "${pkgname}.sh" > "${pkgname}"
}

package() {
    install -d "${pkgdir}/usr/share"
    unzip -o "${pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share" || true
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
