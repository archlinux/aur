# Maintainer: Issa M. Omais <me0@ioplus.dev>

pkgname=wavetask
pkgver=1.1
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
sha256sums=('ef7cf0930e9dbc6e687e5239adc5911f45499b2dbe5b9264b06b3cd1187d17bb')

options=('!debug')

build() {
  cd "$srcdir/$_pkgsrc"
  cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
  cmake --build build -j$(nproc)
}

package() {
  cd "$srcdir/$_pkgsrc"
  DESTDIR="$pkgdir" cmake --install build
}
