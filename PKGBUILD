# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=system-monitoring-center
pkgver=2.17.1
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
sha256sums=('65a1a02cd2309e56d79c7ae801406acbf852b059e3651938dfaf182419db39f6')

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
