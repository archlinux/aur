# Maintainer: Aloys23 <aloys23@duck.com>
_pkgname=gonavi
pkgname=${_pkgname}-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="A Modern Lightweight Database Client built with Wails (Go) and React"
arch=('x86_64')
url="https://github.com/Syngnat/GoNavi"
license=('Apache-2.0')

# 使用现代依赖：webkit2gtk-4.1
depends=('gtk3' 'webkit2gtk-4.1')

provides=("$_pkgname")
conflicts=("$_pkgname")

# 更新为 WebKit41 版本的下载链接
source=(
    "https://github.com/Syngnat/GoNavi/releases/download/v${pkgver}/GoNavi-${pkgver}-Linux-Amd64-WebKit41.tar.gz"
    "${_pkgname}.svg::https://cdn.jsdelivr.net/gh/Syngnat/GoNavi@dev/logo.svg"
)
sha256sums=('0febfbeda93c3f76fb2c74a9f0928b0da624977c14bfff2560c47782ec5e0e30'
            'e3a90ddc5ebd2e43239206308f13452ea59c6bc89aa461a61c3c1d84d856d04d')

package() {

    install -Dm755 "${srcdir}/gonavi-build-linux-amd64"* "${pkgdir}/usr/bin/${_pkgname}"

    #  安装应用的矢量图标到系统图标库
    install -Dm644 "${srcdir}/${_pkgname}.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"

    #  创建带有图标的桌面快捷方式 (Desktop Entry)
    install -dm755 "${pkgdir}/usr/share/applications"
    cat <<EOF > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Name=GoNavi
Comment=Modern Lightweight Database Client
Exec=${_pkgname}
Icon=${_pkgname}
Terminal=false
Type=Application
Categories=Development;Database;Utility;
EOF
}
