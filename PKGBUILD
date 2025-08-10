# Maintainer: AntiApple4life <antiapple at antiapple dot net>
pkgname=wayvr-dashboard
pkgver=0.3.6
pkgrel=1
pkgdesc="WayVR Dashboard is a work-in-progress overlay application (WayVR/wlx-overlay-s plugin via IPC) for launching various applications and games directly into a VR desktop environment"
arch=('x86_64')
url="https://github.com/olekolek1000/wayvr-dashboard"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'npm' 'nodejs')
provides=("${pkgname}")
options=('!lto')
install=instructions.install
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/olekolek1000/wayvr-dashboard/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c921c8c126f17db384788310cf66bc3fae0d93a16ef0a9779daeaddb9558c7d8')

prepare() {
  cd ${pkgname}-${pkgver}
  npm install
}

build() {
  cd ${pkgname}-${pkgver}
  npx tauri build -b deb
}

package() {
  cd ${pkgname}-${pkgver}
  cp -a src-tauri/target/release/bundle/deb/${pkgname}_${pkgver}_*/data/* "${pkgdir}"
}
