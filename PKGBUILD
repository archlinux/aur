# Maintainer: Hugo Posnic <hugo.posnic@gmail.com>

pkgname=coulr
pkgver=1.8.1
pkgrel=1
pkgdesc="Color box to help developers and designers"
arch=(any)
url="https://github.com/Huluti/Coulr"
license=(MIT)
depends=(gtk3 python-gobject)
makedepends=(meson)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Huluti/Coulr/archive/$pkgver.tar.gz")
sha256sums=('3089db800021f3ce02dfbfcddf5f93047e00523ad2b8b3d4637e380f0c190dd3')

build() {
  arch-meson Coulr-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 Coulr-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
