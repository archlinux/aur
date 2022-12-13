# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=emblem
pkgver=1.1.0
pkgrel=1
pkgdesc="Generate project avatars for your Matrix rooms an git forges"
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/emblem"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('c822b77deeab94fe5baaf07330df6e12c7ed1f6ef77c80ee93d546f32b273b9ae8642346d8ea988b79992142aa62896b317af389cec4d564da53d48a8a25f029')

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
