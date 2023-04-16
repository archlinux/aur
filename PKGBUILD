# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=done
pkgver=0.1.4
pkgrel=1
pkgdesc="Done is a simple to do app that aims to improve on the existing set of features provided to do apps to deliver the ultimate experience."
arch=('x86_64')
url="https://github.com/done-devs/done"
license=('GPL2')
depends=('libadwaita' 'sqlite')
makedepends=('cargo' 'meson')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('7093539795136fd22feef4d3b5484d399dc0a4be39882b047071059bc115bde6f1a09eefa0d63e668d96fa8568b540dfdecc6c459cb82b981db043c1fa6aaf67')

build() {
  local meson_options=(
    --buildtype release
  )

  arch-meson $pkgname-$pkgver build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
