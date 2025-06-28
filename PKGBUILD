# Maintainer: linfeng <2844126834@qq.com>
pkgname=sticky-rs-git
pkgver=2.0.1
pkgrel=1
pkgdesc="Image sticky note app that enables users to stick pictures to the desktop and have them always visible"
arch=('any')
url="https://github.com/FengZhongShaoNian/sticky-rs"
license=('GPL2')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
makedepends=('git' 'file' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'base-devel' 'curl' 'wget' 'rustup' 'pnpm' 'nodejs' 'dpkg')
provides=('sticky-rs')
conflicts=('sticky-rs-bin')
options=('!strip' '!emptydirs')
source=('git+https://github.com/FengZhongShaoNian/sticky-rs')
sha256sums=('SKIP')
prepare() {
    cd sticky-rs
    pnpm install
    pnpm run tauri build
}
package() {
    cd "$srcdir"/sticky-rs/src-tauri/target/release/bundle/deb
    dpkg-deb -x *.deb here
    cd here

    install -Dm755 usr/bin/sticky-rs "$pkgdir"/usr/bin/sticky-rs
    install -Dm755 usr/bin/sticky-rs.sh "$pkgdir"/usr/bin/sticky-rs.sh

    # Install desktop file
    install -Dm644 usr/share/applications/sticky-rs.desktop "$pkgdir"/usr/share/applications/sticky-rs.desktop

    # Install icons
    install -Dm644 usr/share/icons/hicolor/128x128/apps/sticky-rs.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/sticky-rs.png
    install -Dm644 usr/share/icons/hicolor/256x256@2/apps/sticky-rs.png "$pkgdir"/usr/share/icons/hicolor/256x256@2/apps/sticky-rs.png
    install -Dm644 usr/share/icons/hicolor/32x32/apps/sticky-rs.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/sticky-rs.png
  # Extract package data
}
