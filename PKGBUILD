pkgname=twintaillauncher
pkgver=1.1.14
pkgrel=1
_dirname="TwintailLauncher-ttl-v"
pkgdesc='A multi-platform launcher for your anime games'
arch=('x86_64')
license=('GPL-3.0-only')
url=https://github.com/TwintailTeam/TwintailLauncher
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'pango' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'libayatana-appindicator' 'mangohud' 'gamemode')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
provides=("twintaillauncher")
conflicts=("twintaillauncher-git" "twintaillauncher-bin")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/ttl-v${pkgver}.tar.gz")
sha256sums=('SKIP')
options=('!lto' '!debug')

prepare() {
  cd 
  pnpm i
}

build() {
  cd 
  pnpm build:native --no-bundle
}

package() {
  install -Dm644 /LICENSE -t "$pkgdir/usr/share/licenses/"
  install -Dm755 /src-tauri/target/release/resources/hpatchz -t "$pkgdir/usr/lib/twintaillauncher/resources/"
  install -Dm755 /src-tauri/target/release/resources/reaper -t "$pkgdir/usr/lib/twintaillauncher/resources/"
  install -Dm644 /src-tauri/target/release/resources/hkrpg_patch.dll -t "$pkgdir/usr/lib/twintaillauncher/resources/"
  install -Dm755 /src-tauri/target/release/twintaillauncher -t "$pkgdir/usr/bin"
  install -Dm644 /twintaillauncher.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 /src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 /src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 /src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/266x256@2/apps/$pkgname.png"
}
