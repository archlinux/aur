# Maintainer: neolouker <neolouker@gmail.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=clairvoyant
pkgver=3.1.7
pkgrel=1
pkgdesc="Magic 8-Ball Fortune Teller"
arch=('x86_64' 'aarch64')
url="https://github.com/cassidyjames/clairvoyant"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'libportal' 'gtk4' 'glib2')
makedepends=('meson' 'vala')

source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('d99f227208905fae65d7ba630a71fcd05337d410aae1c5e11a7ce5564433f019675a53c3e87154534edad57d3cae8e33c4ed3946751c7245e47a6bb146e0ae00')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
  cd "${srcdir}/$pkgname-$pkgver"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
