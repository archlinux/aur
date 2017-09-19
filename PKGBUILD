# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: alex korobtsov <korobcoff@gmail.com>
# Contributor: Alexander Bantyev <balsoft@yandex.ru>

pkgname=qomp
pkgver=1.2.1
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
_commit=0ba092306affeb2c68b1a00dedbf5fa8f749ad45 #tag 1.2.1
source=("git+https://github.com/qomp/qomp#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd "$srcdir/${pkgname}"
  git submodule init
  git submodule update
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
	-DUSE_QT5=ON \
	-DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR="$pkgdir/"  install
}

