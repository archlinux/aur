# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=dynamic-power-daemon
pkgver=5.10.0
pkgrel=1
pkgdesc="Auto-switches powerprofilesctl/asusctl profiles by CPU load & workload; with DBus control, per-user helpers and Qt tray UI"
arch=('x86_64')
url="https://github.com/evertvorster/dynamic-power-daemon"
license=('GPL-3.0-or-later')
conflicts=('power-profiles-daemon')
depends=(
  'libkscreen'
  'qt6-base'
  'systemd'
  'upower'
  'yaml-cpp'
)
makedepends=(
  'cmake'
  'pkgconf'
)
optdepends=(
  'asusctl: panel overdrive toggle on Asus laptops'
)
source=("https://github.com/evertvorster/dynamic-power-daemon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9e2661cef34730ec02c9ebcb4b3f87e1a9ae09fbde9696dfe06f05aefa42b2f0')

build() {
  cd $srcdir/$pkgname-$pkgver/src
  cmake -S . -B build \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DBUILD_TESTING=OFF
  cmake --build build --parallel
}

install="${pkgname}.install"

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"/src
	DESTDIR="${pkgdir}" cmake --install build
}
