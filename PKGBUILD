pkgname=twintaillauncher-bin
_pkgname="${pkgname%-bin}"
pkgver=2.5.2
pkgrel=1
pkgdesc='Your anime games, one launcher'
arch=('x86_64' 'aarch64')
url=https://github.com/TwintailTeam/TwintailLauncher
license=('GPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'pango' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'libayatana-appindicator' 'mangohud')
optdepends=('gamemode: Feral Interactive gamemode utility' 'gamescope: ValveSoftware gamescope session utility')
options=('!debug')
provides=("twintaillauncher")
conflicts=("twintaillauncher-git" "twintaillauncher")
source_x86_64=("${_pkgname}-${pkgver}-amd64.deb::${url}/releases/download/ttl-v${pkgver}/twintaillauncher_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-arm64.deb::${url}/releases/download/ttl-v${pkgver}/twintaillauncher_${pkgver}_arm64.deb")
sha256sums_x86_64=('297e50669606d9a743b8debc401f44429aed5c50a3be475cea5d5894c54002e2')
sha256sums_aarch64=('e1949eaaa7753840d3cc917bd369988b0a2c0a9f98b827607742c7dad81a2097')

build() {
    bsdtar -x -f data.tar.gz
}

package() {
    install -Dm755 usr/bin/twintaillauncher -t "$pkgdir/usr/bin"
    install -Dm755 usr/lib/twintaillauncher/resources/reaper -t "$pkgdir/usr/lib/twintaillauncher/resources"
    install -Dm755 usr/lib/twintaillauncher/resources/winetricks -t "$pkgdir/usr/lib/twintaillauncher/resources"
    install -Dm644 usr/lib/twintaillauncher/resources/hkrpg_patch.dll -t "$pkgdir/usr/lib/twintaillauncher/resources"
    install -Dm644 usr/lib/twintaillauncher/resources/suspend_start.exe -t "$pkgdir/usr/lib/twintaillauncher/resources"
    install -Dm644 usr/share/icons/hicolor/32x32/apps/twintaillauncher.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
    install -Dm644 usr/share/icons/hicolor/128x128/apps/twintaillauncher.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
    install -Dm644 usr/share/icons/hicolor/256x256@2/apps/twintaillauncher.png "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$_pkgname.png"
    install -Dm644 usr/share/applications/twintaillauncher.desktop -t "$pkgdir/usr/share/applications"
    cp -r usr/lib/twintaillauncher/resources/locales "$pkgdir/usr/lib/twintaillauncher/resources/"
}
