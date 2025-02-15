# Maintainer: jude7733 https://github.com/jude7733

pkgname=whatauri-git
pkgver=1.1.0
pkgrel=1
pkgdesc="Whatsapp web wrapper with tray icon and notifications made with tauri"
arch=('any')
url="https://github.com/jude7733/whatauri"
license=('GPL-3.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'file' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'base-devel' 'curl' 'wget' 'rustup' 'npm' 'nodejs' 'dpkg')
provides=('whatauri-git')
conflicts=('whatauri-git')
options=('!strip' '!emptydirs')
source=('git+https://github.com/jude7733/whatauri.git')
sha256sums=('SKIP')
prepare() {
  cd whatauri
  npm install
  npm run tauri build
}
package() {
  cd "$srcdir"/whatauri/src-tauri/target/release/bundle/deb
  dpkg-deb -x whatauri_0.1.0_amd64.deb here

  cd here

  install -Dm755 usr/bin/whatauri "$pkgdir"/usr/bin/whatauri

    # Install desktop file
    install -Dm644 usr/share/applications/whatauri.desktop "$pkgdir"/usr/share/applications/whatauri.desktop

    # Install icons
    install -Dm644 usr/share/icons/hicolor/128x128/apps/whatauri.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/whatauri.png
    install -Dm644 usr/share/icons/hicolor/256x256@2/apps/whatauri.png "$pkgdir"/usr/share/icons/hicolor/256x256@2/apps/whatauri.png
    install -Dm644 usr/share/icons/hicolor/32x32/apps/whatauri.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/whatauri.png
  # Extract package data
}
