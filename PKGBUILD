# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="reqable-bin"
pkgver=1.1.5
pkgrel=1
pkgdesc="A cross platform professional HTTP development and Debugger that supports HTTP1, HTTP2, and HTTP3 (QUIC) protocols"
arch=('x86_64')
url="https://reqable.com"
_githuburl="https://github.com/reqable/reqable-app"
depends=('xz' 'libdbusmenu-gtk3' 'libgcrypt' 'gtk3' 'libayatana-appindicator' 'libepoxy' 'libayatana-indicator' 'libgpg-error' 'lz4' 'pango' \
    'nspr' 'glibc' 'util-linux-libs' 'cairo' 'harfbuzz' 'at-spi2-core' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'nss' 'libdbusmenu-glib')
license=('custom')
source=("${pkgname%-bin}-${pkgver}.deb::https://reqable-app-pkgs.oss-cn-beijing.aliyuncs.com/linux/${CARCH}/${pkgname%-bin}-app-linux-${CARCH}.deb"
    "LICENSE::${url}/zh-CN/policy")
sha256sums=('c5105bda306a464120fda7bf41878bd61993b4f2552321604aee17de72fb51d6'
            'c3c1192fa2d65567215e3517f216b78ee4dfe71567c434a1d7586a0c7ec7ee34')
 
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    sed "s|/usr/share/${pkgname%-bin}/${pkgname%-bin}|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/license/${pkgname}"
}