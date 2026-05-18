# Maintainer: Issa M. Omais <me0@ioplus.dev>

pkgname=wavetask
pkgver=1.3
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
)

_pkgsrc="org.vicko.$pkgname-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('66c44f4bcc7311c1a74860df2e11ea4a4f5d22a64dae544405da049f4cb45b4d')

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
