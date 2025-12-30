# Maintainer: kesefon <aur@froggo.garden>
pkgname=ucp3-gui
pkgver='1.0.14'
pkgrel=0
pkgdesc='GUI for Unofficial Crusader Patch 3'
url="https://github.com/UnofficialCrusaderPatch/UCP3-GUI"
arch=('x86_64')
license=('AGPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
makedepends=('rust' 'nodejs' 'npm' 'git' 'patchelf')
conflicts=()
source=("git+https://github.com/UnofficialCrusaderPatch/UCP3-GUI#tag=v$pkgver")
sha256sums=('4da6c5fcd638eda43446766e87d873267b0cfcf7adc3085b3f469adea4e671cc')

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
