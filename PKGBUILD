# Maintainer: Miepee <janbidler00 at tutanota dot com>
pkgname=am2rlauncher
pkgver=2.1.2
pkgrel=1
pkgdesc="Application for installing the latest Community Updates, APKs and Mods for AM2R."
arch=(x86_64)
url="https://github.com/AM2R-Community-Developers/AM2RLauncher"
license=('GPL3')
depends=('dotnet-runtime>=5' 'gtk3' 'libappindicator-gtk3' 'webkit2gtk' 'openssl' 'icu' 'xdelta3' 'fuse2' 'lib32-libpulse' 'lib32-openal')
makedepends=('git' 'dotnet-sdk>=5')
optdepends=('jre-openjdk: Creating APKs')
conflicts=('am2rlauncher-git')
source=("https://github.com/AM2R-Community-Developers/AM2RLauncher/releases/download/$pkgver/AM2RLauncher_${pkgver}_lin.zip" "AM2RLauncher.ico::https://github.com/AM2R-Community-Developers/AM2RLauncher/raw/$pkgver/AM2RLauncher/AM2RLauncher.Gtk/icon64.ico")
md5sums=(SKIP SKIP)
options=(!strip)
# ^ doesn't correctly publish without

package() {
    # remove orphaned file and replace icon symlink
    rm -f AM2RLauncher_${pkgver}_lin.zip
    cp --remove-destination "$(readlink AM2RLauncher.ico)" AM2RLauncher.ico

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/opt/am2rlauncher/"

    cp -r ./ "$pkgdir/opt/$pkgname"
    mv "$pkgdir/opt/$pkgname/AM2RLauncher.Gtk" "$pkgdir/opt/$pkgname/AM2RLauncher"
    chmod +x "$pkgdir/opt/$pkgname/AM2RLauncher"
    
    # Adding symlink so you can launch from cli
    ln -sf "/opt/am2rlauncher/AM2RLauncher" "$pkgdir/usr/bin/AM2RLauncher"

    # Adding desktop entry
    mkdir -p "$pkgdir/usr/share/applications/"
    echo "[Desktop Entry]
Type=Application
Categories=Game
Encoding=UTF-8
Name=AM2RLauncher
Comment=A front-end application that simplifies installing the latest AM2R-Community-Updates, creating APKs for Android use, as well as Mods for AM2R.
Exec=AM2RLauncher
Icon=/opt/am2rlauncher/AM2RLauncher.ico
Terminal=false" > "$pkgdir/usr/share/applications/am2rlauncher.desktop"
}
