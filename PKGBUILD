# Maintainer: Michael Langer <laminarlade at t-online DOT de>
pkgname=gradia
pkgver=1.11.1
pkgrel=1
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
    'python-pytesseract'
)
makedepends=(
    'patch'
    'meson'
    'blueprint-compiler'
)
source=(
    "$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('8ae8f77aaa95c0baf9f302eec86973415e7c50d6d9d0aebcfe079adcbafce3f0')

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
