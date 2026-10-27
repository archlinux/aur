# Maintainer: taotieren <admin@taotieren.com>

pkgname=serial-port-utility-bin
_name=${pkgname%-bin}
pkgver=6.6.7
pkgrel=1
pkgdesc="Serial, TCP and UDP in one window — up to 16 ports at once, with a transparent bridge between any two of them"
provides=(${_name} SerialPortUtility)
conflicts=(${_name} SerialPortUtility)
arch=($CARCH)
url="https://github.com/alithon/serial-port-utility"
_qt=qt6
depends=(
    libgcc
    libglvnd
    libstdc++
    hicolor-icon-theme
    $_qt-base
    $_qt-serialport
    $_qt-websockets
    $_qt-5compat
)
makedepends=(
    git
    patchelf
)
optdepends=()
options=(!debug)
license=('LicenseRef-scancode-commercial-license')
install=${_name}.install
source=(
    "${pkgname}::git+${url}.git"
    "${url}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-$CARCH.tar.gz")
sha256sums=('SKIP'
            '1834516d4ce0c517612c4af77f806151be08e46017a7f16b91aff048d613f31a')

package() {
    install -vDm0755 SerialPortUtility -t "${pkgdir}/usr/bin/"
    patchelf --remove-rpath "$pkgdir/usr/bin/SerialPortUtility"
    cd ${srcdir}/${pkgname}
    install -vDm0644 THIRD-PARTY-NOTICES.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm0644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm0644 README* -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 SECURITY* -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 SUPPORT* -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 docs/images/logo.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_name}.png"
    install -vDm0644 /dev/stdin "${pkgdir}/usr/share/applications/${_name}.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
MimeType=application/spu
Name=Serial Port Utility
Name[zh_CN]=友善串口调试助手
Comment=Serial, TCP and UDP in one window — up to 16 ports at once, with a transparent bridge between any two of them
Comment[zh_CN]=串口、TCP、UDP 同窗调试，最多 16 路；任意两个连接之间还能透明桥接
Exec=SerialPortUtility
Icon=${_name}
Terminal=false
StartupNotify=false
Categories=Development
EOF
}
