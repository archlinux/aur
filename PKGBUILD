# Maintainer: archibald869 <archibald869 at web dot de>

pkgname=freefilesync-bin
_pkgname=freefilesync
pkgver=11.5
pkgrel=1
pkgdesc="Folder comparison and synchronization"
arch=("i686" "x86_64")
url="https://freefilesync.org"
license=("GPL3")
provides=("freefilesync")
conflicts=("freefilesync")
depends=(
    gtk2
    libxxf86vm
)
depends_i686=(
    lib32-atk
    lib32-fontconfig
    lib32-gdk-pixbuf2
    lib32-libsm
    lib32-libx11
    lib32-pango
)
source=(
    dlagent
    "${pkgname}-${pkgver}.tar.gz::${url}/download/FreeFileSync_${pkgver}_Linux.tar.gz"
    FreeFileSync.desktop
    FreeFileSync.png
    RealTimeSync.desktop
    RealTimeSync.png
)
sha256sums=(
    "3b8121fdf7d91d19680b6ff91f6f10ba79193379e1fdad5227d805b4ea65312a"
    "6953ea298874e413b58a048e606e2d06ef66b7094eb772a5a1ebfd067acda6b2"
    "44f4e2750faad4ca0615a27d1e834b978ed46db2eaf49318ec3172fa6baf6468"
    "b2fac3b8c0badfbbbcf605ecad5b184f2c9918bd0dd14596e6c43df3f2a76a30"
    "80f81f29f4cc0521d761f1f9c678043493bccb2e9378abfebfc88ffb7eb4c424"
    "23c68af45d34f41fdb76886067b71af4dd3fe14f2dd60f73193b2052dc333bf6"
)
options=(!strip)
DLAGENTS=("https::$PWD/dlagent $url %u %o")

package() {
    _pkg=FreeFileSync

    cd "$srcdir"

    install -d "$pkgdir/opt/$_pkgname"
    cp -r "$_pkg"/* "$pkgdir/opt/$_pkgname"

    # documentation
    install -d "$pkgdir/usr/share/doc/$_pkgname"
    ln -sf "/opt/$_pkgname/User Manual.pdf" "$pkgdir/usr/share/doc/$_pkgname/User_Manual.pdf"

    # license
    install -d "$pkgdir/usr/share/licenses/$_pkgname"
    ln -sf "/opt/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    # desktop launcher for FreeFileSync
    install -Dm644 FreeFileSync.png "$pkgdir/usr/share/pixmaps/FreeFileSync.png"
    install -Dm644 FreeFileSync.desktop "$pkgdir/usr/share/applications/FreeFileSync.desktop"

    # desktop launcher for RealTimeSync
    install -Dm644 RealTimeSync.png "$pkgdir/usr/share/pixmaps/RealTimeSync.png"
    install -Dm644 RealTimeSync.desktop "$pkgdir/usr/share/applications/RealTimeSync.desktop"
}
