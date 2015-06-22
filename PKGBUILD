# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
 
pkgname=gnonlin-git
pkgver=1.3.0.1.728.94e3c11
pkgrel=1
pkgdesc='A library for creating non-linear video editors'
arch=('i686' 'x86_64')
url='http://gnonlin.sourceforge.net'
depends=('gstreamer-git' 'gst-plugins-base-git')
provides=('gnonlin='$pkgver)
conflicts=('gnonlin')
options=('!libtool')
license=('LGPL')
 
source=('git+git://anongit.freedesktop.org/gstreamer/gnonlin')
md5sums=('SKIP')
 
_gitname='gnonlin'
 
pkgver() {
  cd $_gitname
  
  version=$(grep AC_INIT configure.ac | sed 's/AC_INIT(GNonLin, //' | sed 's/,//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash  
}
 
build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr
  make
}

#check() {
#  cd $_gitname
#  make check
#}
 
package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}
