# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pinapp
_pkgname=PinApp
pkgver=1.1.7
pkgrel=1
pkgdesc="Create your own application shortcuts"
arch=('any')
url="https://github.com/fabrialberio/PinApp"
license=('GPL3')
depends=('libadwaita' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('00453ea5ef58c42e5524a9457934681ae9d3ba4f7c9345c970f40324d52726e9e50966abf953cd813804efc75814e33e78b140bfff98b22c13fb6c939ed53c6f')

build() {
  arch-meson "${_pkgname%-git}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
