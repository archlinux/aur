# MAINTAINER username227 gfrank227[at]gmail[dot]com
# MAINTAINER qu1ck anlutsenko[at]gmail[dot]com
# This file is generated automatically by CI job at https://github.com/openscopeproject/TrguiNG
pkgname=trgui-ng
pkgver='1.1.0'
pkgrel=1
pkgdesc='Remote GUI for Transmission torrent daemon'
url="https://github.com/openscopeproject/TrguiNG"
arch=('x86_64')
license=('AGPL-3.0')
depends=('alsa-lib' 'cairo' 'desktop-file-utils' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'libsoup' 'openssl' 'webkit2gtk' 'npm')
makedepends=('rust>=1.69.0' 'nodejs>=16.0.0')
source=("git+https://github.com/openscopeproject/TrguiNG#tag=v$pkgver"
        "https://github.com/openscopeproject/TrguiNG/releases/download/v$pkgver/dbip.mmdb"
        "TrguiNG.desktop"::"https://raw.githubusercontent.com/flathub/org.openscopeproject.TrguiNG/master/org.openscopeproject.TrguiNG.desktop")
noextract=('dbip.mmdb')
sha256sums=('SKIP'
            '4e950b00174b3a51b42e46d2c696191c3821c7e7679ee805bdd73e3bafbd36e9'
            '21bef47c8cddae5365a7af8867d43c25e80db53ec8dbb1940138ad26d02a401a')

prepare() {
   cd "$srcdir/TrguiNG"

   cp "../dbip.mmdb" "src-tauri/dbip.mmdb"
}

build() {
    cd "$srcdir/TrguiNG"

    npm ci
    npm run build -- -b
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/trgui-ng"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/32x32/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/128x128/apps"
    install -Dm755 "$srcdir/TrguiNG/src-tauri/target/release/trgui-ng" "$pkgdir/usr/bin/trgui-ng"
    install -Dm644 "$srcdir/TrguiNG/src-tauri/dbip.mmdb" "$pkgdir/usr/lib/trgui-ng/dbip.mmdb"
    install -Dm755 "$srcdir/TrguiNG.desktop" "$pkgdir/usr/share/applications/TrguiNG.desktop"
    install -Dm644 "$srcdir/TrguiNG/src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/trgui-ng.png"
    install -Dm644 "$srcdir/TrguiNG/src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/trgui-ng.png"
    install -Dm644 "$srcdir/TrguiNG/src-tauri/icons/app.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/trgui-ng.svg"
}
