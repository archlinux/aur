# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Ramon Buldó <ramon@manjaro.org>

pkgname=maia-gtk-theme
pkgdesc="Maia GTK theme"
_pkgname=artwork-maia-gtk
pkgver=a0a2a34
pkgrel=1
_gitcommit=a0a2a340517417720a16047d66d95ccd3ca24ada
url="https://github.com/manjaro/$_pkgname/"
arch=('any')
license=('LGPL')
depends=('bash')
makedepends=('extra-cmake-modules' 'git')

source=("maia-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz")
sha256sums=('5779b36e410e1fc1f4a33a04f4d9e163cbd30fcbe0d21ccb893807fe337e620f')

pkg_ver() {
  git rev-parse --short HEAD
}

_gitcommit() {
  git rev-parse HEAD
}

prepare() {
  mv $srcdir/artwork-maia-gtk-$_gitcommit $srcdir/maia
  mkdir -p build
}

build() {
  cd build
  cmake ../maia \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
