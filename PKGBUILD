# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=blurble
_pkgname=Blurble
pkgver=0.1.0
pkgrel=3
pkgdesc="Word guessing game"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/Blurble"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz)
b2sums=('39e18bffeee9d56d4384fe9ccd5fd86edc6f49bb1b31a6559e2fd06a569592169894f94d33af1f7f75f01a2f7d028f4abcdd92185e43800b13ff08c60a02f800')

build() {
  arch-meson "$_pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
