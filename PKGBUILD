# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=passes
pkgver=0.7
pkgrel=1
pkgdesc="A digital pass manager"
arch=('any')
url="https://github.com/pablo-s/passes"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'zint')
makedepends=('meson' 'blueprint-compiler')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('3a5d5deaff27bfc7d70469c9de1ff4eb74ed318f187dbad0d1ca86a78f60e7838268f12fee1cbfb86db3f70db931991713cb772cf00ab8ef39a86acb7deb447b')

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
