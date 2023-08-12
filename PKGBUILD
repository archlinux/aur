# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=system-monitoring-center
pkgver=2.21.0
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
sha256sums=('c0f6b3a16b4f47cc0353cf398096b68cbb5fb2cd27b8bb47cbea535230185733')

prepare() {
  cd "$pkgname-$pkgver"

  # Bump version
  sed -i "s/2.20.2/$pkgver/g" src/__version__
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
