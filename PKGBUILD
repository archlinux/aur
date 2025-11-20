# Maintainer: kesefon <aur@froggo.garden>
pkgname=ucp3-gui
pkgver='1.0.13'
pkgrel=0
pkgdesc='GUI for Unofficial Crusader Patch 3'
url="https://github.com/UnofficialCrusaderPatch/UCP3-GUI"
arch=('x86_64')
license=('AGPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
makedepends=('rust' 'nodejs' 'npm' 'git' 'patchelf')
conflicts=()
source=("git+https://github.com/UnofficialCrusaderPatch/UCP3-GUI#tag=v$pkgver")
sha256sums=('9f07ca3b11989d2f0d5c9bb55dd5522d2470420f47b8bba15761ab7b1ff23429')

build() {
    cd "$srcdir/UCP3-GUI"

    npm ci
    export WEBKIT_DISABLE_COMPOSITING_MODE=1
    export NO_STRIP=true
    WEBKIT_DISABLE_COMPOSITING_MODE=1 NO_STRIP=true npm run tauri build -- -b deb
}

package() {
    cp -a "${srcdir}"/UCP3-GUI/src-tauri/target/release/bundle/deb/*/data/* "$pkgdir"
}
