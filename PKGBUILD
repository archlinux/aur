# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=done
pkgver=0.1.2
pkgrel=1
pkgdesc="Done is a simple to do app that aims to improve on the existing set of features provided to do apps to deliver the ultimate experience."
arch=('x86_64')
url="https://github.com/edfloreshz/done"
license=('GPL2')
depends=('libadwaita' 'sqlite')
makedepends=('cargo' 'meson')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('cc1f1eda3b31e7178a66022ed526da9b68fb3fb9a22ab899afa04ac39b42f7b00618a09446d9fb0dd47ac63d29c18a2ed774e9fb3c233f0ae8e794d58aca0cd7')

build() {
  arch-meson --buildtype release "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
