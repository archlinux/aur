# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=lorem
pkgver=1.1
pkgrel=1
pkgdesc="Simple app to generate the Lorem Ipsum placeholder text"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/design/lorem"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('6363b41be21c919673e9a378fec7667764039162409b3bb91926843dae47b9a04dfb1c4e9b18e26f401ea599e50cae964fca9159ee5c03e64b9f7a1dbf7b2e78')

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
