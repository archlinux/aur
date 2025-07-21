# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=system-monitoring-center
pkgver=2.26.1
pkgrel=1
pkgdesc="Multi-featured system monitor."
arch=('any')
url="https://github.com/mamolinux/system-monitoring-center"
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('42b0d0931650f2de7d4af91258bd9c40d89faf80997ceb10929b7f24cbd7463a')

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
