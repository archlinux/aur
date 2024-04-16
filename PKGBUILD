# Maintainer: tytan652 <tytan652 at tytanium dot xyz>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=emblem
pkgver=1.4.0
pkgrel=1
pkgdesc="Generate project avatars for your Matrix rooms an git forges"
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/emblem"
license=(GPL-3.0-or-later)
depends=('glibc' 'gcc-libs' 'cairo' 'dconf' 'hicolor-icon-theme' 'glib2' 'graphene' 'gtk4' 'libadwaita' 'libxml2' 'pango')
makedepends=('meson' 'cargo')
checkdepends=('appstream')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('e9f3f90570ea37f43d0c4e62ec3faadec2c3581a08d33ecdef71637fde315ba9e842837cb0937159095cbe803e3ff252f63704dc4b4969b73fcbcd1620c60578')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
