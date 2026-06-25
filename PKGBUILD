# Maintainer: Issa M. Omais <me0@ioplus.dev>

pkgname=wavetask
pkgver=1.4
pkgrel=1
pkgdesc="A Plasma 6 task manager plasmoid with zoom effect"
arch=('x86_64')
url="https://github.com/vickoc911/org.vicko.wavetask"
license=('GPL-3.0-only')

depends=(
  'qt6-base'
  'qt6-declarative'
  'ki18n'
  'kservice'
  'kwindowsystem'
  'kconfig'
  'kconfigwidgets'
  'knotifications'
  'kio'
  'kcoreaddons'
  'kitemmodels'
  'libplasma'
  'plasma-activities'
  'plasma-activities-stats'
  'plasma-pa'
  'plasma-workspace'
  'libksysguard'
  'kwin'
  'libepoxy'
  'libdrm'
)

makedepends=(
  'cmake'
  'extra-cmake-modules'
  'gcc'
  'vulkan-headers'
)

_pkgsrc="org.vicko.$pkgname-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e657bcce319eb2a6076803d2c0c4de3497dc0be61d2ea3fd61be21baed15bda5')

options=('!debug')

build() {
  cd "$_pkgsrc"
  cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
  cmake --build build -j$(nproc)
}

package() {
  cd "$_pkgsrc"
  DESTDIR="$pkgdir" cmake --install build
}
