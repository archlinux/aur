# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=clairvoyant
pkgver=3.0.6
pkgrel=1
pkgdesc="Magic 8-Ball fortune teller of sorts"
arch=('x86_64' 'aarch64')
url="https://github.com/cassidyjames/clairvoyant"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'vala')
source=($url/archive/$pkgver.tar.gz)
b2sums=('b8f916deee4957f4a30411d65cd3cace0bc89119d86e53cbc7d72ef5bffe83f32c024a3a822bf927d03f794eb3abee48bd26a6289e4fc97167656d45ce22dcc0')

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
