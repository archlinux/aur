# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=lorem
pkgver=1.2
pkgrel=1
pkgdesc="Simple app to generate the Lorem Ipsum placeholder text"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/design/lorem"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('4457a976d311ce9c44871bbf9946b294e12d4bbda6b578a87d4d3431410ce272c14f3f51fabccff973ebfc700a397b109d346088d0cc777ee58658c902b91bd4')

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
