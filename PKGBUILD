# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=done
pkgver=0.1.7
pkgrel=1
pkgdesc="Done is a simple to do app that aims to improve on the existing set of features provided to do apps to deliver the ultimate experience."
arch=('x86_64')
url="https://github.com/done-devs/done"
license=('MPL2')
depends=('libadwaita' 'sqlite')
makedepends=('cargo' 'meson')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('66886efcdb08e22374b520cd32c81b3d595d3cffc71a66976f0eb6c019f3899d')

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
