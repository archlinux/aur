# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=github-desktop
_appname=GitHubDesktop
pkgname="${_pkgname}-zh-bin"
pkgver=3.2.7
pkgrel=4
pkgdesc="GUI for managing Git and GitHub.Chinese SC Version.Github Desktop 汉化版"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://desktop.github.com"
_githuburl="https://github.com/shiftkey/desktop"
_githubzhurl="https://github.com/robotze/GithubDesktopZhTool"
license=('MIT')
depends=('hicolor-icon-theme' 'libsecret' 'perl' 'curl' 'libxfixes' 'libxkbcommon' 'libxrandr' 'glibc' 'pango' 'at-spi2-core' 'nspr' 'libxcomposite' \
    'libcups' 'alsa-lib' 'dbus' 'libdrm' 'expat' 'zlib' 'gcc-libs' 'cairo' 'libxcb' 'libxext' 'glib2' 'libx11' 'libxdamage' 'nss' 'gtk3' 'mesa')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${pkgname%-zh}")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/release-${pkgver}-linux2/${_appname}-linux-amd64-${pkgver}-linux2.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/release-${pkgver}-linux2/${_appname}-linux-armhf-${pkgver}-linux2.deb")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/release-${pkgver}-linux2/${_appname}-linux-amd64-${pkgver}-linux2.deb")
source=("${_pkgname}-${pkgver}-zh.7z::${_githubzhurl}/releases/download/${pkgver}/${_appname}.7z"
    "LICENSE::https://raw.githubusercontent.com/shiftkey/desktop/linux/LICENSE")
sha256sums=('ed82eb4ddb6155d8d7d6496ebc94a3610120038c4e8a2cf61c83b027564822da'
            '891d678cd6aa67c0712f663b5fee690f24d11d360795300814f7bf2eb91ba530')
sha256sums_aarch64=('0730ee6f8a5c904c01490ed3e09e49bdd18c22a94a3ce56cd4a5c07403047b61')
sha256sums_armv7h=('a37a9fc2f3edc386fce545be173c49e02ddf5ef1b27b77fae35961d8bed9cb6e')
sha256sums_x86_64=('0730ee6f8a5c904c01490ed3e09e49bdd18c22a94a3ce56cd4a5c07403047b61')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    echo -e "Name[zh_CN]=Github桌面版" >> "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    echo -e "Comment[zh_CN]=从桌面版对Github进行简单协作" >> "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    sed "s|${_pkgname} %U|/opt/${pkgname%-bin}/${_pkgname}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    cp "${srcdir}/GithubDesktop汉化工具/Linux/"*.js "${srcdir}/usr/lib/${_pkgname}/resources/app/"
    cp -r "${srcdir}/usr/lib/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 32x32 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}