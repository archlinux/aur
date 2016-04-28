# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=fotowall
pkgver=0.9
pkgrel=2
pkgdesc="A creative tool that allows you to layout your photos or pictures in a personal way"
arch=('i686' 'x86_64')
url="http://www.enricoros.com/opensource/fotowall/"
license=('GPL2')
depends=('qt4' 'v4l-utils')
source=("http://fotowall.googlecode.com/files/Fotowall-${pkgver}.tar.bz2")
sha256sums=('e4d0c005d2cb1d7c09438bfc3098eadebc08946e4fbc0655b7fc8b046de3810d')

prepare() {
  cd Fotowall-${pkgver}
  # for hidden-file-or-dir warning 
  sed -i -e "s/\.build/build/" ${pkgname}.pro
  # for v4l1 compatibility
  sed -i -e 's/linux\/videodev.h/libv4l1-videodev.h/' 3rdparty/videocapture/VideoDevice.h
}

build() {
  cd Fotowall-${pkgver}
  qmake-qt4 PREFIX=/usr
  make
}

package() {
  cd Fotowall-${pkgver}
  make INSTALL_ROOT="${pkgdir}/" install
}
