# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Eric Bélanger <eric@archlinux.org>
pkgname=gweled
_pkgver=1.0-beta1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A puzzle game similar to Bejeweled or Diamond Mine"
arch=('x86_64')
url="https://gweled.org"
license=('GPL-2.0-or-later')
depends=(
  'clutter-gtk'
  'gsound'
  'gtk3'
  'libgnome-games-support'
)
makedepends=('meson')
checkdepends=('appstream-glib')
source=("https://launchpad.net/gweled/1.0/${_pkgver}/+download/$pkgname-${_pkgver}.tar.xz")
sha256sums=('f4930b1ebb4ecc8f7a021a3b185a668e9ec26a0dcdb9b361a00edbad557e9f62')

build() {
  arch-meson "$pkgname-${_pkgver}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
