# Maintainer: Voxan <admin at hessfr dot fr>

pkgname=pinapp
_pkgname=Pins
pkgver=2.4.5
pkgrel=1
pkgdesc="Create your own application shortcuts"
arch=('any')
url="https://github.com/fabrialberio/PinApp"
license=('GPL3')
depends=('libadwaita' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('8a0cd6f2a8edbe194e3163209718e95c655aa44d735a2e2ea71aae62083f4389fad3d4a14d57b7368651bf63b6d9341e2a365e2d6ac6b25a3a33aed27ae50c8d')

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
