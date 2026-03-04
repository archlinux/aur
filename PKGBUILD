# Maintainer: xycld

_pkgname=truelink-monitor
pkgname=plasma6-applet-truelink-monitor
pkgver=1.1.16
pkgrel=1
pkgdesc="Real WiFi physical layer monitor for KDE Plasma 6 - shows RSSI dBm, PHY Rate, MCS, MIMO"
arch=('x86_64')
url="https://github.com/xycld/truelink-monitor"
license=('MIT')
depends=(
  'plasma-workspace>=6.0'
  'libplasma'
  'networkmanager-qt'
  'libnl'
)
makedepends=(
  'cmake'
  'extra-cmake-modules>=6.0'
  'qt6-base'
  'qt6-declarative'
  'ki18n'
  'libplasma'
  'networkmanager'
)

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/truelink-monitor-v$pkgver.tar.gz")

# Replace this with the checksum from the GitHub Release artifact
# `truelink-monitor-v$pkgver.tar.gz.sha256`.
sha256sums=('58a6a464281ef98069fcbe8e531b8ef4fdcd8591bbae8782cf69af95bfe95921')

build() {
  local srcdir_name="${_pkgname}-v${pkgver}"

  cmake -B build -S "$srcdir_name" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
