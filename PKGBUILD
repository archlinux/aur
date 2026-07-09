# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>
pkgname=oss-browser2
pkgver=2.2.0
pkgrel=1
pkgdesc="ossbrowser 2是阿里云官方提供的OSS图形化管理工具，提供类似Windows资源管理器的功能"
arch=('x86_64')
url="https://github.com/aliyun/oss-browser"
license=('Custom')
depends=('electron41')
source=(
"https://gosspublic.alicdn.com/oss-browser2-prod/${pkgver}/oss-browser2-linux-x86_64-${pkgver}.AppImage"
)
sha256sums=('e323aa06c76dead55014b9ee88c11a94f32f93ec4eb66b4ee034fad6c11ceaa8')

prepare() {
    chmod +x oss-browser2-linux-x86_64-${pkgver}.AppImage
    ./oss-browser2-linux-x86_64-${pkgver}.AppImage --appimage-extract
    sed -i 's|^Exec=.*|Exec=electron41 /opt/oss-browser2/app.asar "\$@"|' \
        squashfs-root/oss-browser2.desktop
}

package() {
    cd squashfs-root
    install -D resources/app.asar ${pkgdir}/opt/oss-browser2/app.asar
    install -D usr/share/icons/hicolor/1024x1024/apps/oss-browser2.png \
	${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/oss-browser2.png
    install -D oss-browser2.desktop ${pkgdir}/usr/share/applications/oss-browser2.desktop
}
