# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=chirurgien
_pkgname=Chirurgien
pkgver=1.1
pkgrel=1
pkgdesc="Chirurgien helps understand and manipulate file formats"
arch=('any')
url="https://github.com/leonardschardijn/Chirurgien"
license=('GPL3')
depends=('gtk4' 'glib2')
makedepends=('meson')
checkdepends=('appstream-glib')
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('8b9a0f14cf8a6a0baa2db05c36ac9119db1a87bbc1fd9d8b9d4d03f4bf5e817b')

build() {
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}