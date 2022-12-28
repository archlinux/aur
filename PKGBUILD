# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=game-of-life
pkgver=0.3.0
pkgrel=1
pkgdesc="A simulator of Conway's game of life"
arch=('x86_64' 'aarch64')
url="https://github.com/sixpounder/game-of-life"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($pkgname-$pkgver.tar.gz::$url/archive/v${pkgver//_/-}.tar.gz)
b2sums=('82c37ef178ad8f8eb664426acc353fe5fdce46a2d60753fd15455cc761599a2a3a1c27dafbadea0bf56842776ba198f0bda0eba78db5694e9a5b2e23a5326530')

build() {
  local meson_options=(
    --buildtype release
  )

  arch-meson "$pkgname-${pkgver//_/-}" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
