# Maintainer: nightsidearch <nightsidemail@gmail.com>
pkgname=openrc-manager-gui
pkgver=1.0.0
pkgrel=1
pkgdesc="Modern Qt6 C++ graphical user interface to manage OpenRC services and view boot logs in real-time"
arch=('x86_64' 'aarch64')
url="https://github.com"
license=('GPL3')
depends=('qt6-base' 'kde-cli-tools')
makedepends=('qt6-base' 'pkgconf' 'cmake')
source=("main.cpp" "CMakeLists.txt" "openrc-manager-gui.pc" "openrc-manager-gui.desktop" "openrc-manager-gui.svg")
sha256sums=('b261f07e8d17be9cd4303a4a8e49c658e987ccece720ca057dfc6f927b0e67a1'
            '2868896c82f3a53fcf20f2d9c96a70de35c6d460ef225e123445907b48852b51'
            'fd4a542e86d08182b3cdfb5fee1eb0b8228d18b20be2780f1694bcc49a3e30c1'
            '3493605324912d9e2fc9e54227faeb49837eb9a7860e6d8dd52d4b20edc67edc'
            'c14831791a803016a39dc6930ee2e85a9b45f2f6302f7a9de1d3c103e04074ba')

build() {
    cd "$srcdir"
    cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$srcdir"
    
    # Install the compiled binary executable
    install -Dm755 build/openrc-manager-gui "$pkgdir/usr/bin/openrc-manager-gui"
    
    # Install the launch icon (SVG vector format)
    install -Dm644 openrc-manager-gui.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/openrc-manager-gui.svg"
    
    # Install the KDE Plasma desktop launcher
    install -Dm644 openrc-manager-gui.desktop "$pkgdir/usr/share/applications/openrc-manager-gui.desktop"
    
    # Install the pkgconfig metadata file
    install -Dm644 openrc-manager-gui.pc "$pkgdir/usr/lib/pkgconfig/openrc-manager-gui.pc"
}
