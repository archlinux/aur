# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: workonfire <kolucki62@gmail.com>

pkgname=contrast
pkgver=0.0.5
pkgrel=1
pkgdesc='Checks whether the contrast between two colors meet the WCAG requirements'
arch=('x86_64')
url='https://gitlab.gnome.org/World/design/contrast'
license=('GPL3')
depends=('gtk4' 'glib2' 'libadwaita')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('70a0d97155aa09738d19183e97210003823de11249c77d6740c230256389710590d7f300b806fa9a57477fa552c249520968acd3db69810df44c64908781041f')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
