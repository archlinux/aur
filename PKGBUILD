# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: alex korobtsov <korobcoff@gmail.com>
# Contributor: Alexander Bantyev <balsoft@yandex.ru>

pkgname=qomp
pkgver=1.4
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
makedepends=('git' 'cmake')
_commit=3cbc6ccc5653737b3e1e0b4884bb370e67144604 #tag 1.4.0
source=(git+https://github.com/qomp/qomp.git#commit=$_commit)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {

 cd "$srcdir/$pkgname"
 git submodule init
 git submodule update

}

build() {
  cd "$srcdir/$pkgname"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/"  install
}


