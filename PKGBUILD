# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=emblem
pkgver=1.2.0
pkgrel=1
pkgdesc="Generate project avatars for your Matrix rooms an git forges"
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/emblem"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('a09d4eae01ec0a1696cca234616e470d4ce63944c450ff3ac47acd134e147b3b80881db7a7aadb6edb1a2a20902ff872c8cf25510d2a73e9ac956cd67a9306cb')

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
