# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname=icon-library
pkgver=0.0.18
pkgrel=1
pkgdesc='Find the right symbolic icon to use on your GNOME application'
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/design/icon-library"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('f0ab6dad623a7ecd2c992718fd6e5e65f8e8336a973dbc3fc5c7d990096771c98994f13d248bd0cc0b47b80f8d684756875847def690827660584e1eb87666e0')

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

