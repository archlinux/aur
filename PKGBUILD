# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>
pkgname=oss-browser2
pkgver=2.1.1
pkgrel=1
pkgdesc="ossbrowser 2是阿里云官方提供的OSS图形化管理工具，提供类似Windows资源管理器的功能"
arch=('x86_64')
url="https://github.com/aliyun/oss-browser"
license=('Custom')
depends=('electron38')
source=(
"https://gosspublic.alicdn.com/oss-browser2-prod/${pkgver}/oss-browser2-linux-x86_64-${pkgver}.AppImage"
)
sha256sums=('617069c3621b9b66ed04d6b370c1cdd1086786b5bc11058fad81896b23f4dd7a')

prepare() {
    chmod +x oss-browser2-linux-x86_64-${pkgver}.AppImage
    ./oss-browser2-linux-x86_64-${pkgver}.AppImage --appimage-extract
    sed -i 's|^Exec=.*|Exec=electron38 /usr/lib/oss-browser2/app.asar "\$@"|' \
        squashfs-root/oss-browser2.desktop
}

package() {
    cd squashfs-root
    install -D resources/app.asar ${pkgdir}/usr/lib/oss-browser2/app.asar
    install -D usr/share/icons/hicolor/1024x1024/apps/oss-browser2.png \
	${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/oss-browser2.png
    install -D oss-browser2.desktop ${pkgdir}/usr/share/applications/oss-browser2.desktop
}
