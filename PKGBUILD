# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: workonfire <kolucki62@gmail.com>

pkgname=contrast
pkgver=0.0.8
pkgrel=1
pkgdesc='Checks whether the contrast between two colors meet the WCAG requirements'
arch=('x86_64' 'aarch64')
url='https://gitlab.gnome.org/World/design/contrast'
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('521e21d426fd222ed7698ebb9573ecd3a174119f32208b98594891d2d601621baf8ff00726358b6bbaa2c98ff52900f7d0319717af3d5a6978420c296a633bd8')

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
