# Maintainer: Ian D. Scott <ian@perebruin.com>
# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: damir <damir at archlinux dot org>

_pkgname=corewars
pkgname=corewars-gtk2
pkgver=0.9.13
pkgrel=1
pkgdesc="Simulation game where a number of programs try to crash each other"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/corewars/"
license=('GPL2')
depends=('gtk2')
source=(${_pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/${_pkgname}/files/${_pkgname}%20%28stable%2C%20tar.gz%29/${pkgver}/${_pkgname}-${pkgver}.tar.gz/download http://sourceforge.net/p/corewars/patches/_discuss/thread/947a192c/b4cd/attachment/corewars-gtk2.patch.gz)
md5sums=('0a0b8067533b83a96488109ee265f664'
         '557e1601a94f76862014c271b4e06d8f')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  zcat ../corewars-gtk2.patch.gz | patch -p1
  sed -i 's/LIBS="$LIBS $GTK_LIBS"/LIBS="-lm $LIBS $GTK_LIBS"/' configure.ac
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
