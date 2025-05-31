# Maintainer: grtsinry43 <grtsinry43@outlook.com>

pkgname=bili-liveluckdraw-appimage
pkgver=1.0.5
pkgrel=1
pkgdesc="一个B站直播抽奖工具，通过获取弹幕关键词进行抽奖，使用Electron + React + Vite构建"
arch=('x86_64')
url="https://github.com/grtsinry43/Bili-LiveLuckDraw"
license=('MIT')
depends=()
options=(!strip)
source_x86_64=("bili-liveluckdraw-${pkgver}.AppImage::https://github.com/grtsinry43/Bili-LiveLuckDraw/releases/download/v${pkgver}/Bili-LiveLuckDraw-Linux-v${pkgver}.AppImage"
              "icon.png::https://github.com/grtsinry43/Bili-LiveLuckDraw/raw/main/public/icon.png")
noextract=("bili-liveluckdraw-${pkgver}.AppImage")
sha256sums_x86_64=('6e0727aa0eb869e787962a3e46e55c807cee5c517f69a469ecb20dd7a69cfbf7'
                    '5da3f0c0fe4d63683191a14c54bb4117fef51e3d6289a22ef02c98cd8262eaa6'
)

package() {
    install -Dm755 "${srcdir}/bili-liveluckdraw-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

    # Create desktop entry
    mkdir -p "${pkgdir}/usr/share/applications"
    cat <<EOF > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
[Desktop Entry]
Name=Bili-LiveLuckDraw
Comment=一个B站直播抽奖工具，通过获取弹幕关键词进行抽奖，使用Electron + React + Vite构建
Exec=/opt/${pkgname}/${pkgname}.AppImage
Icon=/opt/${pkgname}/icon.png
Terminal=false
Type=Application
Categories=Utility;
EOF

    # Install icon
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/opt/${pkgname}/icon.png"
}

