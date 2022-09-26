# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=sums
pkgver=0.8
pkgrel=2
pkgdesc="Sums is a simple GTK postfix calculator that adheres to GNOME's human-interface guidelines"
arch=('x86_64')
url="https://gitlab.com/leesonwai/sums"
license=('GPL3')
depends=('libadwaita' 'mpfr')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=("${url}/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('ae4d834b35e6d5ed660d525095a06d62848364ad429907e34dc59ca16cd4a2b5782f5a9f97e8a91c73974a97f5749e319ab0c3b7df45414a2b157eee1c44b6a4')

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
