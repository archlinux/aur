# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=github-desktop
pkgname="${_pkgname}-zh-bin"
pkgver=3.2.7
pkgrel=1
pkgdesc="GUI for managing Git and GitHub.Chinese SC Version.Github Desktop 汉化版"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://desktop.github.com"
_githuburl="https://github.com/shiftkey/desktop"
_githubzhurl="https://github.com/robotze/GithubDesktopZhTool"
license=('MIT')
depends=('electron24')
makedepends=('asar')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${pkgname%-zh}")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/release-${pkgver}-test7/GitHubDesktop-linux-amd64-${pkgver}-test7.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/release-${pkgver}-test7/GitHubDesktop-linux-armhf-${pkgver}-test7.deb")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/release-${pkgver}-test7/GitHubDesktop-linux-amd64-${pkgver}-test7.deb")
source=("${_pkgname}-${pkgver}-zh.7z::${_githubzhurl}/releases/download/3.2.6/GithubDesktop.7z"
    "LICENSE::https://raw.githubusercontent.com/shiftkey/desktop/linux/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('7496a1b1fd6247c6e6287f7ac98c28e63502981cf16e2f09b0b86cc26af4c80e'
            '891d678cd6aa67c0712f663b5fee690f24d11d360795300814f7bf2eb91ba530'
            '340f1a5cf1f8b903679608619be19a8e326bea0ab8af924cc54946589b8b51c6')
sha256sums_aarch64=('6031515cb44652e573cd231aa2ae151768947f5612cbb98322c3dd2b9ed861d1')
sha256sums_armv7h=('34aba140ece5fe97ffe505d3f30c8989a3b3fc665969016df8bf93c56855bb2a')
sha256sums_x86_64=('6031515cb44652e573cd231aa2ae151768947f5612cbb98322c3dd2b9ed861d1')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    echo -e "Name[zh_CN]=Github桌面版" >> "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    echo -e "Comment[zh_CN]=从桌面版对Github进行简单协作" >> "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    sed "s|github-desktop %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    cp "${srcdir}/GithubDesktop汉化工具/Linux/"*.js "${srcdir}/usr/lib/${_pkgname}/resources/app/"
    asar pack "${srcdir}/usr/lib/${_pkgname}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 32x32 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}