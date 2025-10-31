# Maintainer: Caesim404 <caesim404 at gmail dot com>

pkgname="yatqa"
_realpkgver="3.9.9b"
pkgver="3.9.9.b"
epoch="1"
pkgrel="2"
pkgdesc="Tool for managing TeamSpeak 3 servers and instances"
arch=("x86_64" "i686")
url="http://yat.qa/"
license=("custom")
depends=("wine")
makedepends=("p7zip" "icoutils")
install="yatqa.install"
source=("https://dl.yat.qa/stable/YaTQA-Setup_${_realpkgver}.exe"
        "yatqa"
        "yatqa.desktop"
        "yatqa.install"
        "LICENSE")
sha256sums=('6695d89c716c34c849f301f627671fd76e93c84404c83de75664821d39a23524'
            '470b2fb010ae0c4424bc91e241735d9f984f3102a7c3ea4b5a941b6c9b3de55f'
            '98c8f8313858f9fd7a00f75001effcf298b8b1bc43e142ac3e361016f5be9c6f'
            '45fe54d9f4655abb6774a01c961ee547507a92c2499645164f14ea5b1dc1a55a'
            '252bc5cb7f5378f218d45cd1c27d59815074087f2c20314d68b4226730d417ad')

build() {
    cd "${srcdir}"
    
    7z x -aos "YaTQA-Setup_${_realpkgver}.exe" yatqa.exe yatqa.ini
    
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
