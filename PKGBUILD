pkgname=twintaillauncher-bin
_pkgname="${pkgname%-bin}"
pkgver=2.4.0
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
sha256sums_x86_64=('2f17ca20659e482f07ba933f62f343900ddfa228c5791fead74d7369f0cf8cd9')
sha256sums_aarch64=('1a46708380683149fc9df064e8a564ea9465283f74ab09432f1fd1ec5473f4d5')

build() {
    bsdtar -x -f data.tar.gz
}

package() {
    install -Dm755 usr/bin/twintaillauncher -t "$pkgdir/usr/bin"
    install -Dm755 usr/lib/twintaillauncher/resources/reaper -t "$pkgdir/usr/lib/twintaillauncher/resources"
    install -Dm755 usr/lib/twintaillauncher/resources/winetricks -t "$pkgdir/usr/lib/twintaillauncher/resources"
    install -Dm644 usr/lib/twintaillauncher/resources/hkrpg_patch.dll -t "$pkgdir/usr/lib/twintaillauncher/resources"
    install -Dm644 usr/share/icons/hicolor/32x32/apps/twintaillauncher.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
    install -Dm644 usr/share/icons/hicolor/128x128/apps/twintaillauncher.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
    install -Dm644 usr/share/icons/hicolor/256x256@2/apps/twintaillauncher.png "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$_pkgname.png"
    install -Dm644 usr/share/applications/twintaillauncher.desktop -t "$pkgdir/usr/share/applications"
    cp -r usr/lib/twintaillauncher/resources/locales "$pkgdir/usr/lib/twintaillauncher/resources/"
}
