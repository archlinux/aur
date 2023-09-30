# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Maintainer: little_sheepycn <little_sheepycn@redstonebuild.onmicrosoft.com>
# Contributor: msojocs <jiyecafe@gmail.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: YidaozhanYa <yidaozhan_ya@outlook.com>
# Contributor: whitels <2959471117@qq.com>
# Contributor: wxt1221 <3264117476@qq.com>
pkgname=bilibili-bin
_pkgname=bilibili
pkgver=1.12.0
pkgrel=2
epoch=4
pkgdesc='哔哩哔哩官方客户端linux移植版。Bilibili official desktop client'
license=('MIT')
depends=('ffmpeg' 'electron' 'libappindicator-gtk3')
arch=('any')
url='https://github.com/msojocs/bilibili-linux'
install="${pkgname}.install"
source=("https://github.com/msojocs/bilibili-linux/releases/download/v${pkgver}-${pkgrel}/bilibili-v${pkgver}-${pkgrel}-x86_64.tar.gz"
        "${_pkgname}"
        "${_pkgname}.svg"
        "${_pkgname}.desktop"
        "LICENSE")
sha256sums=('6c413cbb4dbe5b873e409e6860301801a83499e4f6577f2fc3c8a51a08e6e48b'
            '6f95b66035d7aa6744bb5200f7cb3f5450a82e84303a039fa256803e99631ad5'
            '047cca58d6cac6432476219a342ec43c2d2bb3f9c9784694dff4e30f929484be'
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
    install -Dm644 "${_pkgname}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
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
