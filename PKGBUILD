# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=system-monitoring-center
pkgver=2.16.1
pkgrel=1
pkgdesc="Multi-featured system monitor."
arch=('any')
url="https://github.com/hakandundar34coding/system-monitoring-center"
license=('GPL3')
depends=('dmidecode' 'iproute2' 'libadwaita' 'polkit' 'python-cairo'
         'python-gobject' 'util-linux')
makedepends=('meson')
checkdepends=('appstream-glib')
optdepends=('hwdata: for device vendor-model information of new devices'
            'xorg-xrandr: for more accurate screen resolution and refresh rate detection')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('59463f722b3f9046c60fded67816881be1f4aa092d0a4f14de5a3b1f2070f4f1')

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
