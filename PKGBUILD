# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=qtcam-git
pkgver=db79dca9
pkgrel=1
pkgdesc='a free, Open Source Linux Webcamera Software with more than 10 image control settings'
arch=('i686' 'x86_64')
url='http://www.e-consystems.com/opensource-linux-webcam-software-application.asp'
license=('GPL')
groups=()
depends=(qt5-declarative ffmpeg)
if [[ $CARCH = x86_64 ]]; then
  depends+=(gcc-libs-multilib)
fi
makedepends=(git qtchooser)
source=('git://github.com/econsysqtcam/qtcam.git')
_gitname='qtcam'
md5sums=(SKIP)

pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    git describe --always | sed 's|-|.|g'
  fi
}
build(){
  cd "$srcdir"/$_gitname/src
  msg2 "Starting make"

  qmake 
  make
}
package(){
  cd "$srcdir"/$_gitname/src
  msg2 "Starting make install"
  make INSTALL_ROOT="$pkgdir" install
  install -dm755 "$pkgdir"/usr/bin
  cd "$pkgdir"/usr/bin
  ln -s /opt/Qtcam/bin/Qtcam
}
