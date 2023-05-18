# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="svelte-electron-boilerplate-appimage"
pkgver=2.0.0
pkgrel=1
pkgdesc="Create a desktop app with this user-friendly Svelte boilerplate for electron"
arch=('x86_64')
url="https://npmjs.com/package/@ptkdev/svelte-electron-boilerplate"
_githuburl="https://github.com/ptkdev-boilerplate/svelte-electron-boilerplate"
license=('custom')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${pkgname%-appimage}-${pkgver}-linux_${arch}.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/ptkdev-boilerplate/svelte-electron-boilerplate/main/LICENSE")
sha256sums=('03975d1687475d9c260f2f4ffb469b01b4df49e5ef19bc3af0caa586a512ce80'
            '092c16bb68f5e405a27270b722dff33bddb5c66c3c08e18f10e9def1aa8200a9')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/svelte-electron-boilerplate.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
