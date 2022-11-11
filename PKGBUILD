# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname=icon-library
pkgver=0.0.14
pkgrel=1
pkgdesc='Find the right symbolic icon to use on your GNOME application'
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/design/icon-library"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('08f483f79cd03c3f03c3df521e7e625c3882fff01932350e64c045639325faefc819e43d92b182be55ad54a742e0448e0990b6bf6d174d412d09fbc4e960f56b')

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

