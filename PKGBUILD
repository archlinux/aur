# $Id$
# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>

pkgname=psi-plus-git
pkgver=1.2.161.1.gf3b641d3
pkgrel=2
pkgdesc="Psi+ is a powerful Jabber client (Qt, C++) designed for the Jabber power users (built with Qt 5.x)"
url="http://psi-plus.com"
license=('GPL2')
arch=('x86_64')
depends=('qt5-base' 'qt5-webengine' 'qt5-multimedia' 'qt5-x11extras' 'qca-qt5'
	 'libidn' 'libxss' 'qt5-svg' 'hunspell' 'qtkeychain')
makedepends=('git' 'patch' 'cmake')
provides=("psi-plus=$pkgver" "psi-plus-qt5-git=$pkgver")
conflicts=('psi-plus' 'psi-plus-qt5-git' 'psi-plus-webkit-qt5-git')
source=("git://github.com/psi-plus/psi-plus-snapshots"
	'join.patch')
sha256sums=('SKIP'
            'ea25a58c7efe25979b8d257598608187380e8f35ace25e96cab9c357dcdbc974')


pkgver() {
  cd psi-plus-snapshots
  git describe --long --tags | sed 's/^v//;s/-/./g'
}            
            
prepare() {
  cd psi-plus-snapshots
  patch -p1 <"$srcdir"/join.patch
}

build() {
  cd psi-plus-snapshots
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd psi-plus-snapshots/build

  make DESTDIR="$pkgdir" install
}
