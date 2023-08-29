# Maintainer: kyngs <aurmail at kyngs dot xyz>
# Contributor: Jonathon Fernyhough <jonathon_at_m2x+dev>
# Contributor: Valentin Huélamo (birdtray.desktop, now upstreamed)
# Contributor: Kr1ss <kr1ss.x#yandex#com> (cmake)
# Contributor: Dmitry Valter <dvalter"protonmail"com>

pkgname=birdtray
pkgver=1.11
pkgrel=1
pkgdesc="Run Thunderbird with a system tray icon."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/gyunaev/birdtray"
license=('GPL-3.0')
depends=(qt5-svg qt5-x11extras)
optdepends=('qt5-translations: Support for translations')
makedepends=(cmake qt5-tools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('7e64594704495b33e8e57cb855aa8fb888cb193ef225cc2645976485159c3e5d501ce877761a641c79c186e57d50a589a756148f9601e9b9ef00aa090609d0b7')

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
