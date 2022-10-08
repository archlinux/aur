pkgname=smpeg-git
pkgver=r366.c5793e5
pkgrel=1
pkgdesc="SDL MPEG Player Library"
arch=(x86_64 aarch64)
url=https://icculus.org/smpeg/
license=(LGPL2.1)
depends=(sdl2)
provides=(smpeg2)
source=(git+https://github.com/icculus/smpeg.git)
md5sums=(SKIP)
pkgver(){
  cd smpeg
  echo r`git rev-list --count HEAD`.`git rev-parse --short HEAD`
}
build(){
  cd smpeg
  ./autogen.sh
  sed -i /plaympeg/d Makefile.am  # conflicts with smpeg
  ./configure --prefix=/usr
  make
}
package(){
  cd smpeg
  make DESTDIR=$pkgdir install
}
