# Maintainer: jim3692 <jim3692 at gmail.com>
pkgname="qt5-clx000-git"
pkgver=0.1.0.4c1a1e7
pkgrel=3
pkgdesc="CLX000 plugin for Qt5 (e.g. for integration with SavvyCAN)"
arch=('x86_64')
url="https://github.com/CSS-Electronics/clx000-qt5-plugin"
license=('MIT')
depends=(
  'qt5-base'
  'qt5-serialbus'
  'qt5-serialport'
  )
makedepends=(
  'git'
  'cmake'
  )
options=(!lto)
conflicts=('qt5-clx000')
provides=('qt5-clx000')
source=(
  'plugin::git+https://github.com/CSS-Electronics/clx000-qt5-plugin.git#branch=master'
  '00-no-debug.patch'
  )
sha256sums=(
  'SKIP'
  '55a1a551c8e053cbe7aa25c436a1203cea6488fc862e2e13bb42765b23cb5226'
  )

build() {
  cd "$srcdir/plugin"
  git apply ../00-no-debug.patch

  mkdir -p build
  cmake -S . -B ./build 
  cmake --build ./build
}

package() {
  install -Dm644 "$srcdir/plugin/build/libclx000canbus.so" "$pkgdir/usr/lib/qt/plugins/canbus/libclx000canbus.so"
}
