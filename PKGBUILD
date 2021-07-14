# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=diodon
arch=('i686' 'x86_64')
pkgver=1.11.0
pkgrel=1
pkgdesc="GTK+ clipboard manager"
license=('GPL')
url="https://launchpad.net/diodon"
depends=('gobject-introspection' 'libappindicator-gtk3' 'libpeas' 'xorg-server-xvfb' 'zeitgeist')
makedepends=('cmake' 'meson' 'vala')
source=("https://launchpad.net/diodon/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.xz")
sha256sums=('f5ce0f4250f362360b168bde243cd3049ff994dc01b18bdbdd4f9ab956ef6a63')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  meson --prefix /usr --buildtype=release . builddir -Ddisable-indicator-plugin=true
  ninja -C builddir
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  DESTDIR="$pkgdir" ninja -C builddir install
}
