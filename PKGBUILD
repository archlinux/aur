# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>

pkgname=bilibili-bin
_pkgname=bilibili
pkgver=1.1.0
pkgrel=1
pkgdesc='Bilibili desktop client'
license=('custom')
depends=('ffmpeg' 'electron' 'libappindicator-gtk3')
arch=('x86_64')
url='https://bilibili.com'
install="${pkgname}.install"
source=('https://dl.hdslb.com/mobile/fixed/bili_win/bili_win-install.exe'
        "${_pkgname}"
        "${_pkgname}.png"
        "${_pkgname}.desktop")
sha256sums=('df008294d66a4a30672cdb1c0839d316e94141284dbb14fb8613ea1029f66973'
            '94d6d7816f2f31e1e0bc051be1a5398740de74c2771b51e6d97a17de07fc2ebb'
            '33cba5d0271d5783f353e60dacc01d2edc6629ca760d35427189e316a48f911f'
            '76dce057c03c8f75b011c2072d32948a8db3de0961aec3fd445f40bf1fe79418')

package() {
    sed -i "s/PingFang SC,HarmonyOS_Medium,Helvetica Neue,Microsoft YaHei,//g" "${srcdir}/resources/render/assets/index.36ba380d.css"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/resources/app.asar" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}.asar"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/bilibili"
}
