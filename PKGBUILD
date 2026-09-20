# Maintainer: Lucy <https://github.com/PetLucy>
pkgname=viizeymix
pkgver=0.8.1
pkgrel=1
pkgdesc='VoiceMeeter-style PipeWire mixer, router, gate, and IntelliPan processor'
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
# Replace this after the v0.8.1 tag is published.
sha256sums=('dc5573d45c4a26fa9391757e1f5247aff60b0213fa9725ee67d8b8c8d3f42898')

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
