# Maintainer: Caesim404 <caesim404 at gmail dot com>

pkgname="yatqa"
_pkgver="3.9b"
pkgver="${_pkgver/-/}"
epoch="1"
pkgrel="1"
pkgdesc="Tool for managing TeamSpeak 3 servers and instances"
arch=("x86_64" "i686")
url="http://yat.qa/"
license=("custom")
depends=("wine")
makedepends=("p7zip" "icoutils")
install="yatqa.install"
source=("http://yat.qa/YaTQA-Setup_${_pkgver}.exe"
        "yatqa"
        "yatqa.desktop"
        "yatqa.install"
        "LICENSE")
sha256sums=('13a9ab7ccf130b29432d1b146c0e18267f0adbcfedf35e64e21071c8c0aa8f07'
            '57fcd761e93b6f5d8bd6f4e354aafc9174ecdeea0fe39ea89dc68245b3c9ce02'
            '98c8f8313858f9fd7a00f75001effcf298b8b1bc43e142ac3e361016f5be9c6f'
            '45fe54d9f4655abb6774a01c961ee547507a92c2499645164f14ea5b1dc1a55a'
            'f2e3a5f026505316e61905695317531717e213b2d497132a351748efc861ce5f')

build() {
    cd "${srcdir}"
    
    7z x -aos "YaTQA-Setup_${_pkgver}.exe" yatqa.exe yatqa.ini
    
    wrestool -x -t 14 -o yatqa.ico yatqa.exe
    icotool -x -w 144 -o yatqa.png yatqa.ico
}

package() {
    cd "${srcdir}"
    
    install -Dm644 yatqa.exe "${pkgdir}/usr/share/yatqa/yatqa.exe"
    install -Dm644 yatqa.ini "${pkgdir}/usr/share/yatqa/yatqa.ini"
    
    install -Dm755 yatqa "${pkgdir}/usr/bin/yatqa"
    
    install -Dm644 yatqa.desktop "${pkgdir}/usr/share/applications/yatqa.desktop"
    install -Dm644 yatqa.png "${pkgdir}/usr/share/pixmaps/yatqa.png"
    
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/yatqa/LICENSE"
}
