# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=symbolic-preview
pkgver=0.0.9
pkgrel=1
pkgdesc="Symbolics made easy"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/design/symbolic-preview"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('24590e99d8821a1018924d91c5e2aa50b7b752e0c4c081ec5f642fdf989d6ef86faa846bbebb11a04e64e035a21f240ec8654c4c78618572e4b5816690a51a26')

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
