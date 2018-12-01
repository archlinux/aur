# Maintainer Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

# old version, use this only if an old program depends on zipios++
pkgname=zipios++
pkgver=0.1.5.9+cvs.2007.04.28 # debian's version number
pkgrel=10
pkgdesc="Small C++ library for reading and writing zip files (old version)"
arch=('i686' 'x86_64')
url="http://zipios.sourceforge.net"
license=('LGPL')
conflicts=('zipios-git')
depends=('zlib')
makedepends=('cppunit')
source=("orig::https://deb.debian.org/debian/pool/main/z/zipios++/zipios++_0.1.5.9+cvs.2007.04.28.orig.tar.gz"
        "debian(compressed)::https://deb.debian.org/debian/pool/main/z/zipios++/zipios++_0.1.5.9+cvs.2007.04.28-10.debian.tar.xz")

md5sums=('cb321973d3ab5f39ee0df77ef0af7929'
         'ceff9b8060538f806571cd9cc489a71a')

prepare() {
  cd zipios++*
  patch -p1 < ../debian/patches/no_logo.diff
  patch -p1 < ../debian/patches/zipinputstreambuf.diff
  patch -p1 < ../debian/patches/ptrdiff.diff
  patch -p1 < ../debian/patches/gcc43_fix.diff
  patch -p1 < ../debian/patches/amd64_fix.diff
  patch -p1 < ../debian/patches/pkg-config.diff
}

build() {
  cd zipios++*
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd zipios++*
  make DESTDIR=$pkgdir install
}
