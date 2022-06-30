# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=iotas
pkgver=0.1.1
pkgrel=2
pkgdesc="Simple note taking"
arch=('x86_64')
url="https://gitlab.gnome.org/cheywood/iotas"
license=('GPL3')
depends=('libadwaita' 'sqlite' 'org.freedesktop.secrets' 'gtksourceview5')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('39c0fccb80b6c1f3bb3ab53399d2704db9f5dcc9b55f41324de1931c7a58f9a013ecc00dbd9101369c83c2e7ee95a9ef3dbb340076ed10b5fe327ad911131659')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
