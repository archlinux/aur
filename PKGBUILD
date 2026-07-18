# Maintainer: Excez0 <github@excez0.dev>
pkgname=yumic-server
pkgver=0.2.0
pkgrel=1
pkgdesc="Native Linux WO Mic client with GTK4/Libadwaita UI, system tray, and auto-reconnect"
arch=('x86_64')
url="https://github.com/Excez0/yumic-server"
license=('MIT')
depends=('gtk4' 'libadwaita' 'opus' 'libpulse' 'pipewire')
makedepends=('rust' 'cargo' 'git')
provides=('yumic-server')
conflicts=('yumic-server-git')
source=("yumic-server-${pkgver}.tar.gz::https://github.com/Excez0/yumic-server/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/yumic-server-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/yumic-server-${pkgver}"
  
  # Binary
  install -Dm755 "target/release/yumic-server" "${pkgdir}/usr/bin/yumic-server"
  
  # Desktop entry
  install -Dm644 "assets/yumic.desktop" "${pkgdir}/usr/share/applications/yumic.desktop"
  
  # Icon
  install -Dm644 "assets/yumic.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/yumic.svg"
  
  # License
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}