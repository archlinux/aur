# Maintainer: Stipe Kotarac <stipe@kotarac.net>

pkgname=wl-tray-bridge-git
pkgver=r18.5ea5bbd
pkgrel=1
pkgdesc='wl-tray-bridge bridges the gap between the StatusNotifierItem protocols and wayland compositors implementing jay-tray-v1'
arch=('x86_64')
license=(GPL-3.0-only)
url='https://github.com/mahkoh/wl-tray-bridge'
depends=(
  libpango-1.0.so
  libpangocairo-1.0.so
  libwayland-client.so
)
makedepends=(
  git
  'rust>=1.84.0'
)
options=(!lto)
source=('wl-tray-bridge::git+https://github.com/mahkoh/wl-tray-bridge.git#branch=master')
sha512sums=('SKIP')

pkgver() {
  cd wl-tray-bridge/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd wl-tray-bridge/
  cargo build --release --locked
}

check() {
  cd wl-tray-bridge/
  cargo test --release --locked
}

package() {
  cd wl-tray-bridge/
  install -D -m755 -s target/release/wl-tray-bridge $pkgdir/usr/bin/wl-tray-bridge
}
