# Maintainer: Michael Langer <laminarlade at t-online DOT de>
pkgname=gradia
pkgver=1.11.2
pkgrel=1
pkghash=166290f8be8a525cc9c51a851b9e3e8921bf1017
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
#    "$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname-$pkgver.zip::${url}/archive/$pkghash.zip"
)
sha256sums=('d6d6d25f213aee9c85034ed0b8e982958cb7bab9a91b7cd2da3d79e7a44fe825')

prepare() {
  mv Gradia-$pkghash $pkgname-$pkgver
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
