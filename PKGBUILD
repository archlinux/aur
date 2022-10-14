# Maintainer: Ambition_echo <ambition_echo@outlook.com>

name=serialPortAssistant
pkgname=serialport-assistant-git
pkgver=1.2.1.r0.g963defd
pkgrel=1
pkgdesc="Linux 串口小助手"
arch=('x86_64')
url="https://github.com/ambition-echo/serialPortAssistant"
license=('GPL3')

depends=('qt5-base' 'qt5-serialport')
makedepends=('git' 'make')

source=("git+$url.git"
        "serialPortAssistant.desktop"
        )
sha256sums=("SKIP"
            "101accf332d7a9d18c0630628570951747dc9d4f4797c808c8bc0d24670055df")

pkgver() {
    cd $name
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}


build() {
    mkdir build
    cd build
    qmake ../$name
    make
}

package() {
    cd $name 
    install -Dm644 ./resource/img/icon.svg $pkgdir/usr/share/icons/$name.svg
    install -Dm644 ../$name.desktop $pkgdir/usr/share/applications/$name.desktop

    cd ../build
    install -D ./$name $pkgdir/opt/$pkgname/$name
}
