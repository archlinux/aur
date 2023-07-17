# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=system-monitoring-center
pkgver=2.18.2
pkgrel=1
pkgdesc="Multi-featured system monitor."
arch=('any')
url="https://github.com/hakandundar34coding/system-monitoring-center"
license=('GPL3')
depends=('dmidecode' 'iproute2' 'libadwaita' 'polkit' 'procps-ng' 'python-cairo'
         'python-gobject' 'util-linux')
makedepends=('meson')
checkdepends=('appstream-glib')
optdepends=('hwdata: for device vendor-model information of new devices'
            'xorg-xrandr: for more accurate screen resolution and refresh rate detection')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c89f7d7d455690a577ac5c88f002b96bcd0eea161f0a41238a0e542ba4c809ec')

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
