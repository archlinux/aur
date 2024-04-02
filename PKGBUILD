# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=passes
pkgver=0.9
pkgrel=1
pkgdesc="A digital pass manager"
arch=('any')
url="https://github.com/pablo-s/passes"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'zint')
makedepends=('meson' 'blueprint-compiler')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('1e99594ff7ca5b312d8645d69beefdf60959b7502ea233a42905f191f93ccb60d3ca2b43eef38ce7bb4e844a132328335500b79a43c53deb85b13d6425ba6a33')

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
