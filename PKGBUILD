# Maintainer: Lucy <https://github.com/PetLucy>
pkgname=viizeymix
pkgver=0.7.3
pkgrel=1
pkgdesc='VoiceMeeter-style PipeWire mixer, router, and IntelliPan processor'
arch=('x86_64')
url='https://github.com/PetLucy/ViiZeyMix'
license=('GPL-3.0-or-later')
depends=(
  'python'
  'pyside6'
  'pipewire'
  'libpipewire'
  'wireplumber'
  'pipewire-pulse'
  'libpulse'
)
makedepends=('meson' 'ninja' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cf085c7c3d8b0ab34810a34e912144ec36aad6bef85b000db1ef9ba1a05a70cc')

build() {
  arch-meson "ViiZeyMix-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
  python -m unittest discover -s "ViiZeyMix-$pkgver/tests" -p 'test_*.py' -v
}

package() {
  meson install -C build --destdir "$pkgdir"
}
