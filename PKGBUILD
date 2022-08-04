# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=blurble
_pkgname=Blurble
pkgver=0.2.0
pkgrel=1
pkgdesc="Word guessing game"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/Blurble"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz)
b2sums=('ac43860ddb0864723f0fbd1be350c0ab9f43a134e0dd45de3e1fbc300ee13435a8159bc014c3f74706d788fca1d9a3b0bc68dbe2bd535bab86c9f7e10aed5461')

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
