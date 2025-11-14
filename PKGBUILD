# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=dynamic-power-daemon
pkgver=4.12.3
pkgrel=1
pkgdesc="Auto-switches powerprofilesctl/asusctl profiles by CPU load & workload; with DBus control, per-user helpers and Qt tray UI"
arch=('x86_64')
url="https://github.com/evertvorster/dynamic-power-daemon"
license=('GPL-3.0-or-later')
conflicts=('power-profiles-daemon')
depends=(
  'kscreen'
  'qt6-base'
  'qt6-tools'
  'kscreen'
  'cmake'
  'pkgconf'
  'qt6-base'
  'yaml-cpp'
  'systemd'
  'upower'
)
optdepends=(
  'asusctl: panel overdrive toggle on Asus laptops'
)
source=("https://github.com/evertvorster/dynamic-power-daemon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd $srcdir/$pkgname-$pkgver/src
  cmake -S . -B build \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --parallel
}

install="${pkgname}.install"

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"/src
	DESTDIR="${pkgdir}" cmake --install build
}
