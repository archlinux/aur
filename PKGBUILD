# Maintainer: Naikee <dktgsitu@gmail.com>
#
# The released build, with Python and Qt inside it. Nothing from the system
# is used beyond libGL and fonts, so an Arch upgrade cannot break it — the
# price being eighty megabytes instead of one, and a version that only
# moves when a release is cut.
#
# Prefer ergopsx-git if you would rather follow the repository and let the
# system provide Python and Qt.

_pkgname=ergopsx
pkgname=ergopsx-git
pkgver=0.2
pkgrel=1
pkgdesc="PlayStation 1 save manager: memory cards, containers, game breakdowns, consoles over FTP"
arch=('x86_64')
url="https://github.com/NaikeeAndy/ergopsx"
license=('MIT')
# Measured by starting the build in a bare Arch container: everything else
# it needs travels inside the archive.
depends=('libglvnd' 'fontconfig')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/ErgoPSXSaveManager-v$pkgver-linux-x86_64.tar.gz"
        "ergopsx.desktop::https://raw.githubusercontent.com/NaikeeAndy/ergopsx/v$pkgver/qt/packaging/ergopsx.desktop"
        "ergopsx.png::https://raw.githubusercontent.com/NaikeeAndy/ergopsx/v$pkgver/qt/packaging/ergopsx.png")
sha256sums=('51dd922c1558df6b7a9ddfb9fd634476e2743b255ef93b5adb91515c26c882e5'
            'd0ed821311b4dc49b177bb8e6ec1ebe46b050dda742494ba8ed6494826cef1e2'
            'dd3a905c42eb45341ba0529121d8606fb31cb521bc2f526c8cd574fbacb65448')

package() {
    install -d "$pkgdir/opt/$_pkgname"
    cp -r "$srcdir/ErgoPSXSaveManager/." "$pkgdir/opt/$_pkgname/"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/ErgoPSXSaveManager" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$srcdir/ergopsx.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$srcdir/ergopsx.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
}
