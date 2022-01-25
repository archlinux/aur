# Contributor: Andrew Querol <andrew@querol.me>
# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=chrome-gnome-shell
pkgname=$_name-git
pkgver=10.1.r65.ge609ff2
pkgrel=1
pkgdesc='Native browser connector for integration with extensions.gnome.org'
arch=(any)
url="https://wiki.gnome.org/Projects/GnomeShellIntegrationForChrome"
license=(GPL)
depends=(gnome-shell python-requests python-gobject)
makedepends=(cmake jq git)
provides=($_name)
replaces=(gs-chrome-connector) # Old name
conflicts=(gs-chrome-connector $_name)
source=(git+https://gitlab.gnome.org/GNOME/$_name)
md5sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd $_name
  mkdir -p build
}

build() {
  cd $_name/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_EXTENSION=OFF
}

package() {
  make -C $_name/build DESTDIR="$pkgdir" install
}
