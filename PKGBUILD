# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=tactics
pkgver=0.2
pkgrel=1
pkgdesc="Build your soccer lineup"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/leesonwai/tactics"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('19c9a14598498a7f39cafed8e89f47b7790f7a5fe6f2868beda9280ace59fc627c2e45465c478b9e78d314ecab04be65e73bd8ac9402e71138d697a12b0f29d9')

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
