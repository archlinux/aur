# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot+org>
# Contributor: Valentin Huélamo (birdtray.desktop, now upstreamed)
# Contributor: Kr1ss <kr1ss.x#yandex#com> (cmake)
# Contributor: Dmitry Valter <dvalter"protonmail"com>

pkgname=birdtray
pkgver=1.8.0
pkgrel=2
pkgdesc="Run Thunderbird with a system tray icon."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/gyunaev/birdtray"
license=('GPL-3.0')
depends=(qt5-svg qt5-x11extras)
optdepends=('qt5-translations: Support for translations')
makedepends=(cmake qt5-tools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('66e92a020bf58deb3c3fa6d823d16c6a02575adc')

build() {
  mkdir -p build && cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname/ $pkgname-$pkgver/README.md
}
