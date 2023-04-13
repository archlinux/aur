# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=blurble
_pkgname=Blurble
pkgver=0.4.0
pkgrel=1
pkgdesc="Word guessing game"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/Blurble"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz)
b2sums=('58a1b21102ad9c1e600d70b9dd4a239547cf68a699a2ed33012f2f6c09c0cbac8d0afce66bd3358ba93ccd90d846bbd9d25b285199fedd0f6f0aa04fb4c8a642')

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
