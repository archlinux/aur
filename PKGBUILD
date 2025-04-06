# Maintainer: pvg <pvg@poczta.fm>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Mateusz Herych
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>

_name=kadu
_commit=cb8cdee
pkgname=$_name-git
pkgver=20250405
pkgrel=1
pkgdesc='Qt-based Jabber/XMPP and Gadu-Gadu client'
arch=('i686' 'x86_64')
url='https://github.com/piotr-wrobel/kadu'
license=('GPL')
depends=('enchant' 'boost' 'hicolor-icon-theme' 'injeqt' 'libarchive' 'libgadu' 'libmpdclient' 'libotr'
         'libxss' 'qt5-multimedia' 'qt5-script' 'qt5-svg' 'qt5-webkit' 'qt5-x11extras' 'qt5-xmlpatterns' 'qxmpp-qt5')
makedepends=('cmake' 'qt5-tools')
provides=('kadu')
conflicts=('kadu')
options=('!emptydirs')
source=("$pkgname::git+https://github.com/piotr-wrobel/kadu.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
}

build() {
  mkdir build
  cd build

  cmake ../$pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_CXX_STANDARD=17 \
    -DENABLE_TESTS=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" LIBDIR=/usr/lib install
}
