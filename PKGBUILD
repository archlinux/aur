# Maintainer: Revincx <revincx233@gmail.com>
# Co-Maintainer: Mikata Riko <sanbikappa@qq.com>

pkgname='kikoplay-bin'
pkgver=1.0.1
pkgrel=1
pkgdesc="linux danmaku player"
arch=('x86_64')
license=('GPL3')
url="https://github.com/KikoPlayProject/KikoPlay"
depends=('mpv' 'lua53' 'qhttpengine' 'qt5-websockets')
conflicts=('kikoplay')
optdepends=('aria2: for downloading')
source=(
    "https://github.com/KikoPlayProject/KikoPlay/releases/download/${pkgver}/KikoPlay_${pkgver}_Linux-${arch}.7z"
    # download script module manually due to the module was excluded from appimage package
    "git+https://github.com/KikoPlayProject/KikoPlayScript"
)
sha256sums=(
    "2074ec93642ec092186b8ba14691fb45c1efad03472b2729f006301631b02550"
    SKIP
)

package() {

    cd "${srcdir}/KikoPlay"

    install -Dm644 KikoPlay使用说明.pdf "$pkgdir/usr/share/doc/kikoplay/help.pdf"
    install -Dm755 KikoPlay "$pkgdir/usr/bin/KikoPlay"
    install -Dm644 kikoplay.png "$pkgdir/usr/share/pixmaps/kikoplay.png"
    install -Dm644 kikoplay.desktop "${pkgdir}/usr/share/applications/kikoplay.desktop"

    mkdir -p "${pkgdir}/usr/share/kikoplay"
    # lua script module for danmu search
    cd "${srcdir}/KikoPlayScript"
    rm LICENSE *.md *.png
    install -dm755 "${pkgdir}/usr/share/kikoplay/extension/script"
    cp -r * "${pkgdir}/usr/share/kikoplay/extension/script"

    # web server module for LANserver function
    cd "${srcdir}/KikoPlay"
    install -dm755 "${pkgdir}/usr/share/kikoplay/web"
    cp -r web/* "${pkgdir}/usr/share/kikoplay/web"

    ln -sf KikoPlay "${pkgdir}/usr/bin/kikoplay"
}
