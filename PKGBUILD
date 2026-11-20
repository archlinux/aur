# Maintainer: alejopek alejopek62@gmail.com
pkgname=sys-dashboard
pkgver=1.1.0
pkgrel=1
pkgdesc="Monitor de sistema de escritorio nativo en Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/Alejopek/Sys-Dashboard-"
license=('ISC')
options=('!lto')
depends=('gcc-libs' 'libglvnd' 'libx11' 'libxcb' 'libxkbcommon' 'wayland')
makedepends=('cargo' 'pkgconf' 'wayland-protocols')
_commit=4db2307878ec120019ecf82ac373ecd2f50c384f
_srcname="Sys-Dashboard--${_commit}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('101ed566e9d40d199d27c7cd3f74596eb60a27111ad3345223ff50d11c1c7c01')

build() {
  cd "${_srcname}"
  cargo build --release --locked
}

package() {
  cd "${_srcname}"
  install -Dm755 target/release/sys-dashboard "$pkgdir/usr/bin/sys-dashboard"
  install -Dm644 sys-dashboard.desktop "$pkgdir/usr/share/applications/sys-dashboard.desktop"
}
