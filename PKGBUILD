# Maintainer: archibald869 <archibald869 at web dot de>

pkgname=freefilesync-bin
_pkgname=freefilesync
pkgver=10.11
pkgrel=1
pkgdesc="Folder comparison and synchronization"
arch=("i686" "x86_64")
url="https://freefilesync.org"
license=("GPL3")
provides=("freefilesync")
conflicts=("freefilesync")
depends=(gtk2 lib32-fontconfig lib32-libx11 libxxf86vm lib32-libsm)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/download/FreeFileSync_${pkgver}_Linux.tar.gz"
    FreeFileSync.desktop
    FreeFileSync.png
    RealTimeSync.desktop
    RealTimeSync.png
)
sha256sums=(
    "c71f821909e79baa03fc175b20c50f4f5a21b8fc4d638391dcaa6e0f00ffff85"
    "d46ae777a53c6e1d8e4baa088af4ad2eb798ff9064c2b4bc3768b7192d400eea"
    "b2fac3b8c0badfbbbcf605ecad5b184f2c9918bd0dd14596e6c43df3f2a76a30"
    "11315b1735c4f6af91f3aaaf3b37800c54ce24f10a3e674d94f88048605e4da8"
    "23c68af45d34f41fdb76886067b71af4dd3fe14f2dd60f73193b2052dc333bf6"
)
options=(!strip)
DLAGENTS=("https::/usr/bin/curl -fLC - --retry 5 --retry-delay 3 -A Mozilla -o %o %u")

_auth_request="$(\
    echo "Authenticating for download ..." >&2; \
    /usr/bin/curl -fsSL -A Mozilla "$url/cookie/load-consent.php" \
)"

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
