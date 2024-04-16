# Maintainer: tytan652 <tytan652 at tytanium dot xyz>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname=icon-library
pkgver=0.0.19
pkgrel=1
pkgdesc='Find the right symbolic icon to use on your GNOME application'
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/design/icon-library"
license=(GPL-3.0-or-later)
depends=('glibc' 'gcc-libs' 'cairo' 'dconf' 'gdk-pixbuf2' 'glib2' 'graphene' 'gtk4' 'gtksourceview5' 'hicolor-icon-theme' 'libadwaita' 'pango')
makedepends=('meson' 'cargo')
checkdepends=('appstream')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('db525f8f5e8f5a3840d9f339ea00e7e6f80d4f610a4c47978e9d9837aa62128f301287a9f499753f51a737e799d031a67ec5de83af0cbccd11984cef7c387763')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

