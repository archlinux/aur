# Maintainer: Lucy <https://github.com/PetLucy>
pkgname=viizeymix
pkgver=0.7.4
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
# Replace this after the v0.7.4 tag is published.
sha256sums=('27bd39bdf870bdcd793501af40de011c433e0c09bfef9c4790057483d7f569c9')

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
