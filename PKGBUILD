# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nted-git
pkgver=1.10.19.r2.g6af6374
pkgrel=2
pkgdesc="A free music score editor for Linux."
arch=('i686' 'x86_64')
depends=('harfbuzz' 'gdk-pixbuf2' 'pango' 'gtk2' 'alsa-lib')
makedepends=('git' 'gcc6')
license=('GPL')
url="https://gitlab.com/stefanhusmann/nted"
options=('!libtool' '!strip' '!makeflags')
conflicts=('nted')
provides=('nted')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  echo $(git describe --always|sed s+-+.r+|tr - .)
}
  
build() {
  cd ${pkgname%-git}
  aclocal
  automake --add-missing
  autoreconf
  CXX=g++-6 CXXFLAGS=" -O2 -std=c++11 -Wno-narrowing -fpermissive" ./configure --prefix=/usr 
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
}
