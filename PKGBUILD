# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=aiksaurus
pkgver=1.2.1
pkgrel=4
pkgdesc="A cross-platform, open-source thesaurus"
url="http://aiksaurus.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'aiksaurus-gcc44.patch')
md5sums=('3eae03b7c49843ccc9262e52846ea6b4'
         '7f94749172116b1529fc21b718ee7636')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # gcc44 build patch
  patch -Np0 -i ${srcdir}/aiksaurus-gcc44.patch

  ./configure --prefix=/usr --with-gtk
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
