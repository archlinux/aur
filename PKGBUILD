# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Maintainer: little_sheepycn <little_sheepycn@redstonebuild.onmicrosoft.com>
# Contributor: 	msojocs <jiyecafe@gmail.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=bilibili-bin
_pkgname=bilibili
pkgver=1.12.0
pkgrel=2
pkgdesc='哔哩哔哩官方客户端linux移植版。Bilibili official desktop client'
license=('MIT')
depends=('ffmpeg' 'electron' 'libappindicator-gtk3')
arch=('any')
url='https://github.com/msojocs/bilibili-linux'
install="${pkgname}.install"
source=("https://github.com/msojocs/bilibili-linux/releases/download/v${pkgver}-${pkgrel}/bilibili-v${pkgver}-${pkgrel}-x86_64.tar.gz"
        "${_pkgname}"
        "${_pkgname}.png"
        "${_pkgname}.desktop"
	"LICENSE")
sha256sums=('6c413cbb4dbe5b873e409e6860301801a83499e4f6577f2fc3c8a51a08e6e48b'
            'f12c25a340f0b235bfa6f29c449b3fd6e8cff529dfbcdf4317a4001a8816246a'
            '33cba5d0271d5783f353e60dacc01d2edc6629ca760d35427189e316a48f911f'
            '3e7b5ca32d3f29532a7101511006092a746a0433514a718f9f9c7d7342fb13b5'
            '21668b8229199de1a523b82805c80d6e110a67fef5766aa7cc3c7df4416d1468')
prepare(){
    cd ${srcdir}
    rm -rf bin
    rm -rf electron
}

package() {
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
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
