# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=spedread
_pkgname=Spedread
pkgver=2.3.0
pkgrel=1
pkgdesc="GTK speed reading software: Read like a speedrunner!"
arch=('x86_64')
url="https://github.com/Darazaki/Spedread"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('6d9bc053f16c5adc6d390ebf08bf778d9aaaa1d6e721e3e27f0e0299afc34c4fd70274d59594edb824f6c3a1829383a58764f51ddfed7ed7816934eccf448df7')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
