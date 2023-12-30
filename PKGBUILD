# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: workonfire <kolucki62@gmail.com>

pkgname=contrast
pkgver=0.0.10
pkgrel=1
pkgdesc='Checks whether the contrast between two colors meet the WCAG requirements'
arch=('x86_64' 'aarch64')
url='https://gitlab.gnome.org/World/design/contrast'
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('2425e0111157e893c80d2177949c071ed906f3b215bc64a3c6b26cfd27aa93c14f0a4cf62bb6867dd0a4f3bb87c03a22f5b88f82da88aed32d5cd50867b4da82')

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
