# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=diodon
pkgver=1.12.0
pkgrel=1
pkgdesc="GTK+ clipboard manager"
arch=('i686' 'x86_64')
license=('GPL')
url="https://launchpad.net/diodon"
depends=('gobject-introspection' 'libappindicator-gtk3' 'libpeas' 'xorg-server-xvfb' 'zeitgeist')
makedepends=('cmake' 'meson' 'vala')
source=("$pkgname-$pkgver.tar.xz::$url/trunk/$pkgver/+download/$pkgname-$pkgver.tar.xz")
sha256sums=('e5f0d8165e293e10a21a0466b50dfaee6ecaa56b678f72bf161ee09287b65f09')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  meson --prefix /usr --buildtype=release . builddir -Ddisable-indicator-plugin=true
  ninja -C builddir
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  DESTDIR="$pkgdir" ninja -C builddir install
}
