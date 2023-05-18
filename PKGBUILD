# Maintainer: AntiCompositeNumber <anticompositenumber+aur@gmail.com>
pkgname=f1multiviewer-bin
pkgver=1.18.0
pkgrel=1
pkgdesc="Unofficial desktop client for F1TV"
arch=('x86_64')
url="https://multiviewer.app"
license=('unknown')  # Licenses in the dist apply to Electron, not f1multiviewer
depends=('nss' 'alsa-lib' 'gtk3' 'at-spi2-core' 'xdg-utils')
provides=('f1multiviewer')
conflicts=('f1multiviewer')
install=f1multiviewer-bin.install
source=("https://releases.multiviewer.app/download/108753914/MultiViewer.for.F1-linux-x64-1.18.0.zip"
    "f1multiviewer.desktop")  # This URL changes for every release, you must grab it from https://multiviewer.app/download each time.
noextract=()
sha256sums=('6e2b3dc105556872e201b4f56030296df342f3047bbf68dd6d7410e7c7838718'
            '00dd9ca8d94a729b80125f6f9ee2287ccd3f86975338c5ce1d12575130d73a6a')

package() {
    install -d "$pkgdir/opt/$pkgname"
    cp -a "MultiViewer for F1-linux-x64/." "$pkgdir/opt/$pkgname"
    chmod 755 "$pkgdir/opt/$pkgname/MultiViewer for F1"

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/MultiViewer for F1" "$pkgdir/usr/bin/f1multiviewer"
    install -Dm644 "MultiViewer for F1-linux-x64/resources/app/.webpack/main/88a36af69fdc182ce561a66de78de7b1.png" "$pkgdir/usr/share/pixmaps/f1multiviewer.png"
    install -Dm644 f1multiviewer.desktop "$pkgdir/usr/share/applications/f1multiviewer.desktop"

    install -Dm644 "MultiViewer for F1-linux-x64/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/Electron-LICENSE"
    install -Dm644 "MultiViewer for F1-linux-x64/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
