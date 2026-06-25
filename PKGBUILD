# Maintainer: Issa M. Omais <me0@ioplus.dev>

_pkgname=wavetask
pkgname="$_pkgname-git"
pkgver=1.1.r26.gc772608
pkgrel=2
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
  'git'
  'cmake'
  'extra-cmake-modules'
  'gcc'
  'vulkan-headers'
)

conflicts=("$_pkgname")
provides=("$_pkgname=$pkgver")

_pkgsrc="$_pkgname"
source=("$_pkgsrc::git+$url.git")
sha256sums=('SKIP')

options=('!debug')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
  cmake --build build -j$(nproc)
}

package() {
  cd "$_pkgsrc"
  DESTDIR="$pkgdir" cmake --install build
}
