# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>

pkgname=psi-plus-plugins-git
pkgver=1.3.334.0.g124c1822
pkgrel=1
pkgdesc="Additional plugins for Psi+ (built with Qt 5.x)"
arch=('x86_64')
url="https://psi-plus.com"
license=('GPL2')
depends=('qt5-base' 'qt5-multimedia' 'psi-plus-git' 'qt5-webengine')
conflicts=('psi-plus-plugins' 'psi-plus-plugins-qt5-git')
provides=("psi-plus-plugins=$pkgver" "psi-plus-plugins-qt5-git=$pkgver")
makedepends=('libotr' 'tidy' 'git')
optdepends=('libotr: for OTR plugin'
            'tidy: for OTR plugin')
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
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DONLY_PLUGINS=ON  ..
  make
}

package() {
  cd psi-plus-snapshots/build

  make DESTDIR="$pkgdir" install
}

