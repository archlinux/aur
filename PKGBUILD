# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="reqable-bin"
pkgver=1.0.2
pkgrel=1
pkgdesc="A cross platform professional HTTP development and Debugger that supports HTTP1, HTTP2, and HTTP3 (QUIC) protocols"
arch=('x86_64')
url="https://reqable.com"
_githuburl="https://github.com/reqable/reqable-app"
depends=('xz' 'libdbusmenu-gtk3' 'libgcrypt' 'gtk3' 'libayatana-appindicator' 'libepoxy' 'libayatana-indicator' 'libgpg-error' 'lz4' 'pango' \
    'nspr' 'glibc' 'util-linux-libs' 'cairo' 'harfbuzz' 'at-spi2-core' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'nss' 'libdbusmenu-glib')
license=('custom')
source=("${pkgname%-bin}-${pkgver}.deb::https://reqable-app-pkgs.oss-cn-beijing.aliyuncs.com/linux/${CARCH}/${pkgname%-bin}-app-linux-${CARCH}.deb")
sha256sums=('a392243613b544eea3d2288ff04b51b37126e018cfe21880d58634fc514daf83')
 
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr"
    mv "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    mv "${srcdir}/usr/share" "${pkgdir}/usr"
    sed "s|Exec=/usr/share/reqable/${pkgname%-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}