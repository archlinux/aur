 
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Radu Andries <admiral0@tuxfamily.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Mantainer: Lorenzo Ferrillo <lorenzofer at live dot it>
pkgname=lib32-zbar
pkgver=0.10
pkgrel=1
pkgdesc="Application and library for reading bar codes from various sources. 32bit libraries only version"
arch=('x86_64')
url="http://zbar.sourceforge.net/"
license=('LGPL')
depends=('lib32-imagemagick' 'lib32-libxv' 'lib32-python2' 'lib32-gtk2' 'pygtk' 'lib32-v4l-utils')
makedepends=()
conflicts=()
provides=()
optdepends=('lib32-qt4: for libzbarqt')
source=("http://downloads.sourceforge.net/project/zbar/zbar/$pkgver/zbar-$pkgver.tar.bz2"
        v4l1.patch)
md5sums=('0fd61eb590ac1bab62a77913c8b086a5'
         'SKIP')

prepare() {
  cd zbar-$pkgver
  patch -p1 -i ../v4l1.patch
}

build() {
  cd zbar-$pkgver
  export CC="${CC} -m32"
  export CXX="${CXX} -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export PYTHON='/usr/bin/python2-32'
  export PYTHON_CONFIG='/usr/bin/python2-32-config'
  
  ./configure --prefix=/usr --without-qt --with-gtk CFLAGS="$CFLAGS -DNDEBUG"
  make
}

package() {
  cd zbar-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
