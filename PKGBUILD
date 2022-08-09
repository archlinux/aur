# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Maintainer: 	msojocs <jiyecafe@gmail.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=bilibili-bin
_pkgname=bilibili
pkgver=1.4.1
pkgrel=1
pkgdesc='Bilibili desktop client'
license=('custom')
depends=('ffmpeg' 'electron17' 'libappindicator-gtk3')
makedepends=('asar' 'p7zip' 'nodejs')
arch=('any')
url='https://github.com/msojocs/bilibili-linux'
install="${pkgname}.install"
source=("https://github.com/msojocs/bilibili-linux/releases/download/v${pkgver}-${pkgrel}/bilibili-v${pkgver}-${pkgrel}-x86_64.tar.gz"
        "${_pkgname}"
        "${_pkgname}.png"
        "${_pkgname}.desktop")
sha256sums=('aeb126c8ce0a3141541465bcd871d37eca228ec73f4f5edb136941f06f46ae6d'
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
}
