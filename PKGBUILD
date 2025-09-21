# Maintainer: AntiCompositeNumber <anticompositenumber+aur@gmail.com>
# Maintainer: ExtremTechniker <aur@extremtechniker.io>
pkgname=f1multiviewer-bin
pkgver=2.2.1
# This ID changes for every release, you must grab it from https://multiviewer.app/download each time.
_build=295039430
pkgrel=1
pkgdesc="Unofficial motorsports desktop client"
arch=('x86_64')
url="https://multiviewer.app"
license=('unknown')  # Licenses in the dist apply to Electron, not f1multiviewer
depends=('nss' 'alsa-lib' 'gtk3' 'at-spi2-core' 'xdg-utils')
makedepends=('asar')
provides=('f1multiviewer')
conflicts=('f1multiviewer')
install=f1multiviewer-bin.install
source=("https://releases.multiviewer.app/download/$_build/MultiViewer-linux-x64-$pkgver.zip"
    "f1multiviewer.desktop")
noextract=()
sha256sums=('a635f3381bc20c7608fcf24fb765461d83ceef1b23f46bcea1768fa5f233d2e7'
            '00dd9ca8d94a729b80125f6f9ee2287ccd3f86975338c5ce1d12575130d73a6a')

package() {
    install -d "$pkgdir/opt/$pkgname"
    cp -a "MultiViewer-linux-x64/." "$pkgdir/opt/$pkgname"
    chmod 755 "$pkgdir/opt/$pkgname"
    chmod 755 "$pkgdir/opt/$pkgname/multiviewer"

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/multiviewer" "$pkgdir/usr/bin/f1multiviewer"
    ln -s "/opt/$pkgname/multiviewer" "$pkgdir/usr/bin/multiviewer"

    asar extract-file "MultiViewer-linux-x64/resources/app.asar" ".webpack/main/88a36af69fdc182ce561a66de78de7b1.png"
    install -Dm644 "88a36af69fdc182ce561a66de78de7b1.png" "$pkgdir/usr/share/pixmaps/f1multiviewer.png"
    install -Dm644 f1multiviewer.desktop "$pkgdir/usr/share/applications/f1multiviewer.desktop"

    install -Dm644 "MultiViewer-linux-x64/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/Electron-LICENSE"
    install -Dm644 "MultiViewer-linux-x64/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
