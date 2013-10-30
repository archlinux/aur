# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gtkmathview
pkgver=0.8.0
pkgrel=3
pkgdesc="C++ rendering engine for MathML documents"
arch=('i686' 'x86_64')
url="http://helm.cs.unibo.it/mml-widget/"
license=('GPL')
depends=('popt' 'gtk2' 't1lib' 'gmetadom')
source=("http://helm.cs.unibo.it/mml-widget/sources/${pkgname}-${pkgver}.tar.gz"
        'gtkmathview-0.8.0-gcc44.patch'
        'gtkmathview-0.8.0-cond-t1.patch')
md5sums=('b53564e553728d4b69f7d366dfeb5299'
         '9fd261db865336c89ebf0f3545af9bc4'
         'a79a27e00908e75712bc9453b669fe61')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -Np1 -i ${srcdir}/gtkmathview-0.8.0-gcc44.patch
  patch -Np1 -i ${srcdir}/gtkmathview-0.8.0-cond-t1.patch
  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir}/ install
}

