# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=khronos
pkgver=3.7.0
pkgrel=1
pkgdesc="Track each task's time in a simple inobtrusive way"
arch=('x86_64')
url="https://github.com/lainsce/khronos"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'libgee')
makedepends=('meson' 'gobject-introspection' 'vala')
source=(${url}/archive/$pkgver.tar.gz)
b2sums=('10662eeb842330e5571379c80febbde861f7d788e16b2b5dfb94cb3be9558cf03ab0983cc43873761c8f895a0ac7f3f5d6f0f699f671b0adb0ef96c315d17cb6')

build() {
  arch-meson ${pkgname%-git}-${pkgver} build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
