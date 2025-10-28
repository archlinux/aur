# Maintainer: AntiApple4life <antiapple at antiapple dot net>
pkgname=wayvr-dashboard
pkgver=0.3.8
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
sha256sums=('25303faa213ef48650ab4f741568d08cdf34441667a6058e22f93faa2b66aad1')

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
