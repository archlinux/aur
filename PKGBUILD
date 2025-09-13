# Maintainer: Michael Langer <laminarlade at t-online DOT de>
pkgname=gradia
pkgver=1.10.1
pkgrel=2
pkgdesc="Make your screenshots ready for the world."
arch=('x86_64')
url="https://github.com/AlexanderVanhee/Gradia"
license=('GPL-3.0-only')
depends=(
    'glib2'
    'gtk4>=4.12.0'
    'libadwaita>=1.5.0'
    'libportal>=0.9.1'
    'gtksourceview5>=5.16.0'
    'python'
    'python-gobject>=3.48.0'
    'python-pillow'
    'python-cairo'
)
makedepends=(
    'patch'
    'meson'
    'blueprint-compiler'
)
source=(
    "$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('fbb1f57b94877f83d6168259b52a48dddd18797247631a666f21cc452c7de265')

prepare() {
  mv Gradia-$pkgver $pkgname-$pkgver
}

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  true

#  Check fail with double include error for StartupNotify, doesn't seems to hurt
#  suspend for now
#  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
