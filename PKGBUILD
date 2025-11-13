# Maintainer: kyngs <aurmail at kyngs dot xyz>
# Contributor: Jonathon Fernyhough <jonathon_at_m2x+dev>
# Contributor: Valentin Huélamo (birdtray.desktop, now upstreamed)
# Contributor: Kr1ss <kr1ss.x#yandex#com> (cmake)
# Contributor: Dmitry Valter <dvalter"protonmail"com>

pkgname=birdtray
pkgver=1.11.4
pkgrel=2
pkgdesc="Run Thunderbird with a system tray icon."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/gyunaev/birdtray"
license=('GPL-3.0')
depends=(qt5-svg qt5-x11extras)
optdepends=('qt5-translations: Support for translations')
makedepends=(cmake qt5-tools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('e3e5663bb343d991c66ff0bd774fdc1abf74a5e94f7ea42ecfe5e16f3c1be932fe8d91ae0d9a6e43d75475671f4f18df0a90f80a09e58892d9629c4cc464b729')

prepare() {
  # Need to do this to prevent weird issues when updating
  rm -rf build
}

build() {
  mkdir -p build && cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname/ $pkgname-$pkgver/README.md
}
