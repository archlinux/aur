# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=system-monitoring-center
pkgver=2.26.3
pkgrel=1
pkgdesc="Multi-featured system monitor."
arch=('any')
url="https://github.com/mamolinux/system-monitoring-center"
license=('GPL-3.0-or-later')
depends=(
  'dmidecode'
  'gtk4'
  'hwdata'
  'iproute2'
  'libadwaita'
  'polkit'
  'procps-ng'
  'python-cairo'
  'python-gobject'
  'util-linux'
)
makedepends=('meson')
optdepends=(
  'amdgpu_top: for video engine load on GPU tab and per-process GPU usage, GPU memory columns on Processes tab'
  'raspberrypi-utils: for physical RAM size, GPU frequency and video memory information on Raspberry Pi devices'
  'xorg-xrandr: for more accurate screen resolution and refresh rate detection'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5d3c18cea0dd35ab87ee1464f3856f37378d107e3b1cb6a62f6b33c15625fe2b')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
