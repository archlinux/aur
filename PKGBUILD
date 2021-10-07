# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=diodon
pkgver=1.11.1
pkgrel=1
pkgdesc="GTK+ clipboard manager"
arch=('i686' 'x86_64')
license=('GPL')
url="https://launchpad.net/diodon"
depends=('gobject-introspection' 'libappindicator-gtk3' 'libpeas' 'xorg-server-xvfb' 'zeitgeist')
makedepends=('cmake' 'meson' 'vala')
source=("$pkgname-$pkgver.tar.xz::$url/trunk/$pkgver/+download/$pkgname-$pkgver.tar.xz")
sha256sums=('a494b5b50210c5ff21b35c4e3fd72ba2b846462eeab5ce69fcb28dadcded3912')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  meson --prefix /usr --buildtype=release . builddir -Ddisable-indicator-plugin=true
  ninja -C builddir
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  DESTDIR="$pkgdir" ninja -C builddir install
}
