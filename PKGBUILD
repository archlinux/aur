# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: workonfire <kolucki62@gmail.com>

pkgname=contrast
pkgver=0.0.7
pkgrel=1
pkgdesc='Checks whether the contrast between two colors meet the WCAG requirements'
arch=('x86_64')
url='https://gitlab.gnome.org/World/design/contrast'
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('aab52c9ec721d97a287200b3e168ddc91458aab1380f3da6708327835717d69aec06a42a3d5fb2521f61baa6d2ffe1765e03710db5c301805a8bee3de49dcbc7')

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
