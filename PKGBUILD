# Maintainer: linfeng <2844126834@qq.com>
pkgname=sticky-rs-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Image sticky note app that enables users to stick pictures to the desktop and have them always visible"
arch=('any')
url="https://github.com/FengZhongShaoNian/sticky-rs"
license=('GPL2')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
makedepends=('nodejs' 'pnpm' 'rust' 'dpkg')
provides=('sticky-rs')
conflicts=('sticky-rs')
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
