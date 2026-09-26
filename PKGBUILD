# Maintainer: Lucy <https://github.com/PetLucy>
pkgname=viizeymix
pkgver=0.8.2
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
# Replace this after the v0.8.2 tag is published.
sha256sums=('023d36a5366f6fadbe79cc375499fca1bf4e112a26a168f665a8e663c1284d8a')

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
