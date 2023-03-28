# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=github-desktop
pkgname="${_pkgname}-bin-zh"
pkgver=3.2.0
pkgrel=2
pkgdesc="GUI for managing Git and GitHub.Chinese SC Version.Github Desktop 汉化版"
arch=('x86_64')
url="https://desktop.github.com"
_githuburl="https://github.com/shiftkey/desktop"
_githubzhurl="https://github.com/robotze/GithubDesktopZhTool"
license=(MIT)
depends=(gtk3 at-spi2-core alsa-lib openssl-1.1 libsecret nss perl libxrandr hicolor-icon-theme zlib glib2 libcups libxfixes \
    libxdamage pango libxext cairo gcc-libs libx11 dbus libxcb curl mesa libxcomposite nspr libdrm glibc sh libxkbcommon expat)
optdepends=()
provides=("${_pkgname}" robotze)
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/release-${pkgver}-linux1/GitHubDesktop-linux-${pkgver}-linux1.deb"
    "${_pkgname}-${pkgver}-zh.7z::${_githubzhurl}/releases/download/${pkgver}/GithubDesktop.7z"
    "LICENSE::${_githuburl}/raw/linux/LICENSE")
sha256sums=('d435a8666cd0c27513c55577d19f4607cd5d95a3ce5e598607237932ed63a614'
            '1b935ad2da5f7187516dbe0044f36871e7dab251b540b632cac758ae8492392f'
            'baf5eda4dbccae53079cbf33fcb3439abddad686bb860e93294af07522247582')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -dm755 -d "${pkgdir}/opt/${_pkgname}"
    mv "${pkgdir}/usr/lib/github-desktop" "${pkgdir}/opt/"
    rm -r "${pkgdir}/usr/lib"
    echo "Name[zh_CN]=Github桌面版" >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    echo "Comment[zh_CN]=从桌面版对Github进行简单协作" >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    cp "${srcdir}/GithubDesktop汉化工具/Linux/"*.js "${pkgdir}/opt/github-desktop/resources/app"
    ln -sf "/opt/$_pkgname/$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}