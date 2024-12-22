# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=passes
pkgver=0.10
pkgrel=1
pkgdesc="A digital pass manager"
arch=('any')
url="https://github.com/pablo-s/passes"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'zint')
makedepends=('meson' 'blueprint-compiler')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('f1d31b4e91539efed1eb7d3c0a15040919b56c5fa1de6eb97a8655e15bd018d5e89695593fdea76fa003a5d944e52e3330ef0fd1901e9b5cce5f3275684f6634')

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
