# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Maintainer: little_sheepycn <little_sheepycn@redstonebuild.onmicrosoft.com>
# Contributor: 	msojocs <jiyecafe@gmail.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=bilibili-bin
_pkgname=bilibili
pkgver=1.9.1
pkgrel=3
pkgdesc='哔哩哔哩官方客户端linux移植版。Bilibili official desktop client'
license=('custom')
depends=('ffmpeg' 'electron17' 'libappindicator-gtk3')
arch=('any')
url='https://github.com/msojocs/bilibili-linux'
install="${pkgname}.install"
source=("https://github.com/msojocs/bilibili-linux/releases/download/v${pkgver}-${pkgrel}/bilibili-v${pkgver}-${pkgrel}-x86_64.tar.gz"
        "${_pkgname}"
        "${_pkgname}.png"
        "${_pkgname}.desktop")
sha256sums=('280bb435d379185e298eef9becfce2abcc8efdeb03fb4368b3dd822279abc7d6'
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
    #xdg-icon-resource install --noupdate --context apps --novendor --size 256 "/usr/share/icons/hicolor/512x512/apps/bilibili.png" "bilibili"
    #https://aur.archlinux.org/packages/bilibili-bin#comment-898371
    #https://aur.archlinux.org/packages/bilibili-bin#comment-898393
    #https://aur.archlinux.org/packages/bilibili-bin#comment-898390
    #有点离谱哈，不知道为啥
}
