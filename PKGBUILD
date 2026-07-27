# Maintainer: the_swest
# Contributor: DrSkyfaR <https://github.com/DrSkyfaR>
pkgname=dualcpy-linux
pkgver=1.0.5
pkgrel=1
pkgdesc="Multi-window scrcpy launcher for dual-screen Android handhelds (X11 docking / Wayland floating)"
arch=('any')
url="https://forgejo.skyfar.de/SkyfaR/DualCPY-Linux"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'scrcpy>=4.0'
    'android-tools'
    'tk'
    'python-xlib'
    'python-pillow'
    'python-customtkinter'
    'python-darkdetect'
    'python-mss'
)
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "dualcpy-linux.sh"
        "dualcpy-linux.desktop")
sha256sums=('2d353f17b1a5f0a7068e875943f2f40a1e45e34ce19706cd82fc8d240cc99e81'
            '4f401d149814e34ae39580852b76310b0e281e3f366a0bd0dcfb224cd0213418'
            'a84f963ea9a365da1b993a48caef482f8f42dc33178433eeae1b2036220df4c0')

package() {
    cd "$srcdir/dualcpy-linux"
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r src bin "$pkgdir/opt/$pkgname/"
    install -Dm644 main.py "$pkgdir/opt/$pkgname/main.py"
    if [ -d config ]; then
        cp -r config "$pkgdir/opt/$pkgname/config.default"
    fi
    if [ -d assets ]; then
        cp -r assets "$pkgdir/opt/$pkgname/"
    fi
    install -Dm755 "$srcdir/dualcpy-linux.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/dualcpy-linux.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    if [ -f assets/icon.png ]; then
        install -Dm644 assets/icon.png \
            "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    fi
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
