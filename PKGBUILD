# Maintainer: Aurelien Duval <aurelien.duval6@gmail.com>
pkgname=xfce4-power-profiles-plugin
pkgver=0.1.0
pkgrel=2
pkgdesc="XFCE4 panel plugin for managing power profiles (power-profiles-daemon, TLP, system76-power)"
arch=('x86_64')
url="https://github.com/AurelienDuval6/xfce4-power-profiles-plugin"
license=('GPL-3.0-or-later')
groups=('xfce4-plugins')
depends=('gtk3' 'xfce4-panel')
optdepends=('power-profiles-daemon: default power profile backend (systemd)'
            'tlp: lightweight power profile backend (TLP 1.9+ with D-Bus)'
            'system76-power: power profile backend for System76 hardware')
makedepends=('rust' 'gcc' 'pkg-config' 'libxfce4ui')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AurelienDuval6/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f8d3c66b81605ef71fc87de959a4409fd9103900ce1f73cc30c971b8a7794851')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  bash build.sh
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 libpowerprofiles.so "$pkgdir/usr/lib/xfce4/panel/plugins/libpowerprofiles.so"
  install -Dm644 power-profiles.desktop "$pkgdir/usr/share/xfce4/panel/plugins/power-profiles.desktop"
}
