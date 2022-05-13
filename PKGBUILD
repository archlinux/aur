# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>

pkgname=bilibili-bin
_pkgname=bilibili
pkgver=1.1.0
pkgrel=2
pkgdesc='Bilibili desktop client'
license=('custom')
depends=('ffmpeg' 'electron' 'libappindicator-gtk3')
makedepends=('asar')
arch=('x86_64')
url='https://bilibili.com'
install="${pkgname}.install"
source=('https://dl.hdslb.com/mobile/fixed/bili_win/bili_win-install.exe'
        "${_pkgname}"
        "${_pkgname}.png"
        "${_pkgname}.desktop")
sha256sums=('5d5d86963f5a922ce5f616159e0d5705602aa39c7520dc8a5f0f020adb74a3da'
            '94d6d7816f2f31e1e0bc051be1a5398740de74c2771b51e6d97a17de07fc2ebb'
            '33cba5d0271d5783f353e60dacc01d2edc6629ca760d35427189e316a48f911f'
            '76dce057c03c8f75b011c2072d32948a8db3de0961aec3fd445f40bf1fe79418')

package() {
    asar e "${srcdir}/resources/app.asar" "${srcdir}/unpacked"
    sed -i "s/PingFang SC,HarmonyOS_Medium,Helvetica Neue,Microsoft YaHei,//g" "${srcdir}/unpacked/render/assets/index.36ba380d.css"
    asar p "${srcdir}/unpacked" "${srcdir}/resources/app.asar"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/resources/app.asar" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}.asar"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
