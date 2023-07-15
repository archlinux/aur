# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mini-music-bin"
pkgver=1.5.0
pkgrel=3
pkgdesc="A simple and beautiful music player.一个简单、美观的音乐播放器"
arch=('x86_64')
url="https://gitee.com/cgper/miniMusic"
_githuburl="https://github.com/CGPer/miniMusic"
license=('MulanPSL2')
depends=('bash' 'electron11' 'hicolor-icon-theme')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/V${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::${url}/raw/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('f451f4e717c9364e8e302e9f24e2f7a8a0573734508d96b1c48b3ff548d5b310'
            'd0b16a3cb603569486834cb55fa8a539832063864793339386f5e1f646928987'
            '2b329bc71c3d4eaa98300a4de6beef6ebbb31cd3b5ca90a32cf0680224242fde')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/迷你音乐/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|\"/opt/迷你音乐/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|DesktopApp|AudioVideo|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}" 
}