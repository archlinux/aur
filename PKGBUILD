# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=github-desktop
pkgname="${_pkgname}-zh-bin"
pkgver=3.2.5
pkgrel=1
pkgdesc="GUI for managing Git and GitHub.Chinese SC Version.Github Desktop 汉化版"
arch=('x86_64')
url="https://desktop.github.com"
_githuburl="https://github.com/shiftkey/desktop"
_githubzhurl="https://github.com/robotze/GithubDesktopZhTool"
license=('MIT')
depends=('gtk3' 'at-spi2-core' 'alsa-lib' 'libsecret' 'nss' 'perl' 'libxrandr' 'hicolor-icon-theme' 'zlib' 'glib2' 'libcups' 'libxfixes' \
    'libxdamage' 'pango' 'libxext' 'cairo' 'gcc-libs' 'libx11' 'dbus' 'libxcb' 'curl' 'mesa' 'libxcomposite' 'nspr' 'libdrm' 'glibc' 'sh' 'libxkbcommon' 'expat')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${pkgname%-zh}")
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/release-${pkgver}-linux1/GitHubDesktop-linux-${pkgver}-linux1.deb"
    "${_pkgname}-${pkgver}-zh.7z::${_githubzhurl}/releases/download/3.2.6/GithubDesktop.7z"
    "LICENSE::https://raw.githubusercontent.com/shiftkey/desktop/linux/LICENSE")
sha256sums=('a7eaabf7f68441c7e4280ac2de84f22228c791a3732ee9b7c577929cd7b181b5'
            '7496a1b1fd6247c6e6287f7ac98c28e63502981cf16e2f09b0b86cc26af4c80e'
            '891d678cd6aa67c0712f663b5fee690f24d11d360795300814f7bf2eb91ba530')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -dm755 -d "${pkgdir}/opt"
    mv "${pkgdir}/usr/lib/${_pkgname}" "${pkgdir}/opt/"
    rm -r "${pkgdir}/usr/lib"
    echo -e "Name[zh_CN]=Github桌面版" >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    echo -e "Comment[zh_CN]=从桌面版对Github进行简单协作" >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    cp "${srcdir}/GithubDesktop汉化工具/Linux/"*.js "${pkgdir}/opt/${_pkgname}/resources/app"
    ln -sf "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    chmod 0755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
}