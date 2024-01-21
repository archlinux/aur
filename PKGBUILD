# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=system-monitoring-center
pkgver=2.26.0
pkgrel=1
pkgdesc="Multi-featured system monitor."
arch=('any')
url="https://github.com/hakandundar34coding/system-monitoring-center"
license=('GPL-3.0-or-later')
depends=(
  'dmidecode'
  'iproute2'
  'libadwaita'
  'polkit'
  'procps-ng'
  'python-cairo'
  'python-gobject'
  'util-linux'
)
makedepends=('meson')
checkdepends=('appstream-glib')
optdepends=(
  'amdgpu_top: for video engine load on GPU tab and per-process GPU usage, GPU memory columns on Processes tab'
  'hwdata: for device vendor-model information of new devices'
  'xorg-xrandr: for more accurate screen resolution and refresh rate detection'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('31d2426bfc731bf0181618449988b29b08ff27ce2ac1c577fa7231aa96301c47')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
