# Maintainer: Matthias Baur <aur@matthiasbaur.me>
pkgname=noson-app
pkgver=5.6.27
pkgrel=1
pkgdesc="The essential to control music from your SONOS devices on Linux platforms"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://janbar.github.io/noson-app"
license=('GPL-3.0-only')
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg' 'libpulse' 'flac')
makedepends=('cmake' 'git')
source=("git+https://github.com/janbar/noson-app.git#tag=${pkgver}")

sha256sums=('3ba2aa4a65d3548000645efc2b7fd88539deeea20373b8da449d735aef9d10e4')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake "$srcdir/${pkgname%-git}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  cmake --build .
}

package() {
  cd "$srcdir/build"
  DESTDIR="$pkgdir/" cmake --install .
}
