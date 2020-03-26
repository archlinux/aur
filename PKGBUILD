# Maintainer: Aconscious
pkgname=qusb2snes-git
pkgver=r186.c1eccae
pkgrel=1
pkgdesc="A Qt based webserver for usb2snes"
arch=("x86_64")
license=("GPL3")
arch=("x86_64")
install=.install
provides=("QUsb2Snes"
          "QFile2Snes")
depends=("qt5-websockets"
         "qt5-serialport")
url="https://github.com/Skarsnik/QUsb2snes"
source=("git+https://github.com/Skarsnik/QUsb2snes"
        "QUsb2Snes.desktop"
        "QFile2Snes.desktop")
md5sums=("SKIP"
         "SKIP"
         "SKIP")
_projname="QUsb2snes"

pkgver() {
    cd "$srcdir/$_projname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_projname"
    qmake QUsb2snes.pro CONFIG+='release'
    make
    cd "QFile2Snes"
    qmake QFile2Snes.pro CONFIG+='release'
    make
}

prepare() {
    cd "$srcdir/$_projname"
    convert icon64x64.ico icon.png
}

package() {
    cd "$srcdir/$_projname"
    install -dm 755 "$pkgdir/usr/bin"
    install -dm 755 "$pkgdir/usr/share/pixmaps"
    install -dm 755 "$pkgdir/usr/share/applications"
    install -m 644 icon.png "$pkgdir/usr/share/pixmaps/QUsb2snes.png"
    install -m 755 "QUsb2Snes" "$pkgdir/usr/bin/QUsb2Snes"
    cd "QFile2Snes"
    install -m 755 "QFile2Snes" "$pkgdir/usr/bin/QFile2Snes"
    install -m 644 "icon50x50.png" "$pkgdir/usr/share/pixmaps/QFile2Snes.png"
    cd "$srcdir"
    install -m 644 "QUsb2Snes.desktop" "$pkgdir/usr/share/applications/QUsb2Snes.desktop"
    install -m 644 "QFile2Snes.desktop" "$pkgdir/usr/share/applications/QFile2Snes.desktop"
}
