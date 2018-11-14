# Maintainer: archibald869 at web dot de

pkgname=freefilesync-bin
_pkgname=freefilesync
pkgver=10.6
pkgrel=1
pkgdesc="Folder comparison and synchronization"
arch=("i686" "x86_64")
url="https://www.freefilesync.org/"
license=("GPL3")
provides=("freefilesync")
conflicts=("freefilesync")
depends=(gtk2 lib32-fontconfig lib32-libx11 libxxf86vm lib32-libsm)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://freefilesync.org/download/FreeFileSync_${pkgver}_Linux.tar.gz"
    FreeFileSync.desktop
    FreeFileSync.png
    RealTimeSync.desktop
    RealTimeSync.png
)
sha256sums=(
    "dd1461f846ff71d66d418f26c59120ee6d895f2f01caaf99fc31838f69e8c8fc"
    "461f7deb9245bbcaf281160945ec800e54a703068220d0d239de6dddccad0de3"
    "b2fac3b8c0badfbbbcf605ecad5b184f2c9918bd0dd14596e6c43df3f2a76a30"
    "36a6b962cb5c1cd2c453d1bddaab915b1764614b207ae7f5b3694acf5740940c"
    "23c68af45d34f41fdb76886067b71af4dd3fe14f2dd60f73193b2052dc333bf6"
)
DLAGENTS=("https::/usr/bin/curl -fLC - --retry 5 --retry-delay 3 -A Mozilla -o %o %u")

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
