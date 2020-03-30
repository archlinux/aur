# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=diodon
arch=('i686' 'x86_64')
pkgver=1.9.0
pkgrel=1
pkgdesc="GTK+ clipboard manager"
license=('GPL')
url="https://launchpad.net/diodon"
depends=('gobject-introspection' 'libappindicator-gtk3' 'libpeas' 'xorg-server-xvfb' 'zeitgeist')
makedepends=('cmake' 'meson' 'vala')
source=("http://launchpad.net/diodon/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.xz")
install=$pkgname.install
conflicts=('diodon-git')
md5sums=('59d378c81708d00e92197194e8d8b5a9')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  meson --prefix /usr --buildtype=plain . builddir    # -Ddisable-indicator-plugin=true
  ninja -C builddir
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  DESTDIR="$pkgdir" ninja -C builddir install
}
