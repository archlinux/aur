# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot+org>
# Contributor: Valentin Huélamo (birdtray.desktop, now upstreamed)
# Contributor: Kr1ss <kr1ss.x#yandex#com> (cmake)

pkgname=birdtray
pkgver=1.7.0
pkgrel=1
pkgdesc="Run Thunderbird with a system tray icon."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/gyunaev/birdtray"
license=('GPL-3.0')
depends=(qt5-x11extras sqlite3)
makedepends=(cmake qt5-tools)
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/RELEASE_${pkgver}.tar.gz")
sha1sums=('a11cc398b8f1aa0e4c5d5ae50c0cd87d6d1b6a2a')

build() {
  mkdir -p build && cd build
  cmake ../$pkgname-RELEASE_$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../$pkgname-RELEASE_$pkgver/README.md -t"$pkgdir/usr/share/doc/$pkgname/"
}
