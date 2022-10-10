# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=zap-soundboard
pkgver=1.1.0
pkgrel=1
pkgdesc="Play sounds from a soundboard"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/rmnvgr/zap"
license=('GPL3')
depends=('libadwaita' 'gjs')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/${pkgname%-soundboard}-$pkgver.tar.gz)
b2sums=('1d2a823ae9a13d7f664058b3145e2b5ec4e600bdea6984d7d6ae707cf79d1c92a127410ae40c196a3c732df264f42d30b4b948417ff5987a1cd00687c0ef56b9')

build() {
  arch-meson "${pkgname%-soundboard}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
