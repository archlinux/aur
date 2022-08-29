# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Maintainer: 	msojocs <jiyecafe@gmail.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=bilibili-bin
_pkgname=bilibili
pkgver=1.5.0
pkgrel=2
pkgdesc='Bilibili desktop client'
license=('custom')
depends=('ffmpeg' 'electron17' 'libappindicator-gtk3')
arch=('any')
url='https://github.com/msojocs/bilibili-linux'
install="${pkgname}.install"
source=("https://github.com/msojocs/bilibili-linux/releases/download/v${pkgver}-${pkgrel}/bilibili-v${pkgver}-${pkgrel}-x86_64.tar.gz"
        "${_pkgname}"
        "${_pkgname}.png"
        "${_pkgname}.desktop")
sha256sums=('6b6218a5a63baff115d9953347109b95c736acf8ee70206726a45ce79e7f056e'
            'cd7961420bae8fb54b8523bb8b3190ce1cfb584b73f391bad52ca7a354b1b76f'
            '33cba5d0271d5783f353e60dacc01d2edc6629ca760d35427189e316a48f911f'
            'e8b7502721d837ee056eeb47fe38cbe23d6a9d6fff8228b976543e33d74ea2e5')
prepare(){
    cd ${srcdir}
    rm -rf bin
    rm -rf electron
}

package() {
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/app/app.asar" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.asar"
    install -Dm644 "${srcdir}/app/app-update.yml" "${pkgdir}/usr/share/${_pkgname}/app-update.yml"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    cp -r "${srcdir}/app/extensions" "${pkgdir}/usr/share/${_pkgname}/extensions"
    #xdg-icon-resource install --noupdate --context apps --size 256 "bilibili.png" "bilibili"
}
