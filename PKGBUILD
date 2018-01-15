# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>

pkgname=psi-plus-plugins-git
pkgver=1.2.161.1.gf3b641d3
pkgrel=2
pkgdesc="Additional plugins for Psi+ (built with Qt 5.x)"
arch=('x86_64')
url="http://psi-plus.com"
license=('GPL2')
depends=('qt5-base' 'qt5-multimedia' 'psi-plus-git' 'qt5-webengine')
conflicts=('psi-plus-plugins' 'psi-plus-plugins-qt5-git')
provides=("psi-plus-plugins=$pkgver" "psi-plus-plugins-qt5-git=$pkgver")
makedepends=('libotr' 'tidyhtml')
optdepends=('libotr: for OTR plugin'
            'tidyhtml: for OTR plugin')
source=('git://github.com/psi-plus/psi-plus-snapshots')
md5sums=('SKIP')

pkgver() {
  cd psi-plus-snapshots
  git describe --long --tags | sed 's/^v//;s/-/./g'
}            
    
build() {
  cd psi-plus-snapshots
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib  -DONLY_PLUGINS=ON  ..
  make
}

package() {
  cd psi-plus-snapshots/build

  make DESTDIR="$pkgdir" install
}

