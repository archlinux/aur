# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: alex korobtsov <korobcoff@gmail.com>
# Contributor: Alexander Bantyev <balsoft@yandex.ru>

pkgname=qomp-git
pkgver=1.2.1.r59.gbb0cdba
pkgrel=1
pkgdesc="Quick(Qt) Online Music Player"
arch=('i686' 'x86_64')
url="http://qomp.sourceforge.net/"
license=('GPL2')
depends=('taglib' 'qt5-base' 'qt5-tools' 'qt5-x11extras'
         'qt5-multimedia' 'qt5-xmlpatterns'
         'gstreamer' 'libcue' 'gst-plugins-good')
optdepends=('gst-plugins-bad'
            'gst-plugins-ugly')
makedepends=('git' 'make' 'cmake')
source=(git+https://github.com/qomp/qomp.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/qomp"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/qomp"
  git submodule init
  git submodule update
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
	-DUSE_QT5=ON \
	-DCMAKE_BUILD_TYPE=Release
make
}

package() {
  cd "$srcdir/qomp"
  make DESTDIR="$pkgdir/"  install
}

