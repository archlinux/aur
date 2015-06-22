# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Original Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=gavl-svn
pkgver=1.4.0.4061 
pkgrel=1
pkgdesc='A low level library, upon which multimedia APIs can be built.'
arch=('i686' 'x86_64')
url='http://gmerlin.sourceforge.net/'
license=('GPL')
conflicts=('gavl')
provides=('gavl='$pkgver)
depends=('glibc')
options=('!libtool')

source=("svn://svn.code.sf.net/p/gmerlin/code/trunk/gavl/")
md5sums=('SKIP')

pkgver() {
  cd gavl

  version=$(grep AM_INIT_AUTOMAKE configure.ac | sed 's/AM_INIT_AUTOMAKE(gavl, //' | sed 's/)//')
  revision=$(svnversion | tr -d [A-z])
  
  echo $version.$revision
}

build() {
  cd gavl
  #export CFLAGS="-g3 -O0"
  ./autogen.sh
  ./configure --prefix=/usr --without-doxygen --with-cpuflags=none
  make
}

package() {
  cd gavl
  make DESTDIR="$pkgdir" install
}
