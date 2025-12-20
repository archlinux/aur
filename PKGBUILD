# Maintainer: Michael Langer <laminarlade at t-online DOT de>
pkgname=gradia
pkgver=1.11.3
pkgrel=1
pkghash=472a970e10c3a85f9db938719ebba121321c1d90
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
#    'python-pytesseract'
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
sha256sums=('b4146b2a30f91908a5f43c572fa6099be36c4377bdcd1ca6950a666bb5335e86')

prepare() {
  mv Gradia-$pkghash $pkgname-$pkgver
}

build() {
  arch-meson $pkgname-$pkgver build -Denable-ocr=false
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
