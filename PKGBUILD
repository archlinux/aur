# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Federico Cinelli <cinelli@aur.archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=winestuff
pkgver=0.2.0
pkgrel=3
pkgdesc="Library utility for winegame"
arch=('i686' 'x86_64')
url="http://code.google.com/p/winegame/"
license=('LGPL2.1')
makedepends=('qt4' 'cmake')
source=("http://winegame.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('a01f55d30bd0e1dcee3a44aa0fa5369d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr ..

  make translations
  make
}

package() {
  depends=('qt4' 'fuseiso' 'winetricks')

  cd "$srcdir/$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir" install
}

