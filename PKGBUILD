# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=aalib
pkgname=lib32-$_pkgname
pkgver=1.4rc5
pkgrel=1
pkgdesc="A portable ASCII art graphic library (32 bit)"
arch=('x86_64')
url="http://aa-project.sourceforge.net/aalib/"
license=('LGPL')
depends=('lib32-gpm' 'lib32-libx11' "$_pkgname")
makedepends=('lib32-libxt')
source=(http://downloads.sourceforge.net/sourceforge/aa-project/${_pkgname}-${pkgver}.tar.gz
        aclocal-fixes.patch)
sha1sums=('a23269e950a249d2ef93625837cace45ddbce03b'
          '98d8c5a13672a8107945d694ff4520e0bc87d3e9')

prepare() {
  cd ${_pkgname}-1.4.0
  patch -p0 -i "${srcdir}/aclocal-fixes.patch"
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd ${_pkgname}-1.4.0
  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --libdir=/usr/lib32
  make
}

package() {
  cd ${_pkgname}-1.4.0
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
