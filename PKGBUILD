# Maintainer: AntiCompositeNumber <anticompositenumber+aur@gmail.com>
# Maintainer: ExtremTechniker <aur@extremtechniker.io>
pkgname=f1multiviewer-bin
pkgver=2.0.1
# This ID changes for every release, you must grab it from https://multiviewer.app/download each time.
_build=287846601
pkgrel=1
pkgdesc="Unofficial motorsports desktop client"
arch=('x86_64')
url="https://multiviewer.app"
license=('unknown')  # Licenses in the dist apply to Electron, not f1multiviewer
depends=('nss' 'alsa-lib' 'gtk3' 'at-spi2-core' 'xdg-utils')
provides=('f1multiviewer')
conflicts=('f1multiviewer')
install=f1multiviewer-bin.install
source=("https://releases.multiviewer.app/download/$_build/MultiViewer-linux-x64-$pkgver.zip"
    "f1multiviewer.desktop"
    "f1multiviewer.png")
noextract=()
sha256sums=('64c579d9710df662d7f9beff7bc1acdbdf5e4c1087f5328a516452a661169e0b'
            '00dd9ca8d94a729b80125f6f9ee2287ccd3f86975338c5ce1d12575130d73a6a'
            'e12530bab6425cc2a11ba3d1ef8606f239e0cfddaac8ca732490dbb88bdb3f72')

package() {
    install -d "$pkgdir/opt/$pkgname"
    cp -a "MultiViewer-linux-x64/." "$pkgdir/opt/$pkgname"
    chmod 755 "$pkgdir/opt/$pkgname"
    chmod 755 "$pkgdir/opt/$pkgname/multiviewer"

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/multiviewer" "$pkgdir/usr/bin/f1multiviewer"
    ln -s "/opt/$pkgname/multiviewer" "$pkgdir/usr/bin/multiviewer"
    install -Dm644 "f1multiviewer.png" "$pkgdir/usr/share/pixmaps/f1multiviewer.png"
    install -Dm644 f1multiviewer.desktop "$pkgdir/usr/share/applications/f1multiviewer.desktop"

    install -Dm644 "MultiViewer-linux-x64/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/Electron-LICENSE"
    install -Dm644 "MultiViewer-linux-x64/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
