# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=toa
pkgver=0.0.1
pkgrel=3
pkgdesc='"toa" is simple music player made by Electron.'
arch=('any')
url='https://github.com/yuki540net/toa'
license=('MIT')
depends=('gtk2' 'gconf' 'xdg-utils' 'libxtst' 'libxss' 'nss' 'alsa-lib' 'xdg-utils')
makedepends=('unzip' 'gendesk')
source=(
    "${url}/releases/download/v${pkgver}/toa-linux-x64.zip"
)
noextract=("toa-linux-x64.zip")
md5sums=(
    '869b089bd96d2fe936836595239c3a8e'
)

prepare() {
    unzip -o -q toa-linux-x64.zip

    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

package() {
    install -dm755 ${pkgdir}/usr/bin
    install -dm755 ${pkgdir}/usr/lib

    cp -a ${srcdir}/toa-linux-x64 ${pkgdir}/usr/lib/${pkgname}

    ln -s /usr/lib/toa/toa ${pkgdir}/usr/bin/toa

    install -Dm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/toa-linux-x64/resources/app/icons/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
