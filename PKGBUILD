# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=system-monitoring-center
pkgver=2.23.0
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
sha256sums=('83dedd96d9ee0988e179fcce4f21be93d945bff02f0a91ea0ef2b0c1d541b4c8')

prepare() {
  cd "$pkgname-$pkgver"
}

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
