# Maintainer: neolouker <neolouker@gmail.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=clairvoyant
pkgver=3.1.8
pkgrel=1
pkgdesc="Magic 8-Ball Fortune Teller"
arch=('x86_64' 'aarch64')
url="https://github.com/cassidyjames/clairvoyant"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'libportal' 'gtk4' 'glib2')
makedepends=('meson' 'vala')

source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('3ad7e1a6b627ccb3515c3f08d9571fbe0e496eccfab65fdbc3afc7bd79e824edfedeb1d9d3835847b1389d93d833766ec9fd34281d102a5a8bde95931eff2d15')

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
