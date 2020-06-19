# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Bastien Bouclet <bastien.bouclet@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=gtkglextmm
pkgver=1.2.0
pkgrel=12
pkgdesc="Cpp C++ bindings for gtkglext"
arch=('x86_64')
url="http://gtkglext.sourceforge.net/"
license=('GPL')
depends=('gtkmm' 'gtkglext-pangox')
makedepends=('mesa')
source=("http://downloads.sourceforge.net/sourceforge/gtkglext/${pkgname}-${pkgver}.tar.bz2"
        'gtkglextmm-1.2.0-aclocal.patch'
        'fix_ftbfs_gtk_2_20.patch'
        'fix_ftbfs_gtk_2_36.patch'
        'fix_ftbfs_gtk_2_37.patch')
md5sums=('27c05f4d45c5fd07b6fb0f044add3056'
         '1f331ecdaa6ea3f9eaec8f0e54d6cd82'
         '60a2e7518a148ea3be59669770ee5aaa'
         'dd08d68c5e076dfa3293b00dd4150633'
         'c39860d898a9ce24af3762fd351c5266')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}/gtkglextmm-1.2.0-aclocal.patch"
  patch -Np1 -i "${srcdir}/fix_ftbfs_gtk_2_20.patch"
  patch -Np1 -i "${srcdir}/fix_ftbfs_gtk_2_36.patch"
  patch -Np1 -i "${srcdir}/fix_ftbfs_gtk_2_37.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  CXXFLAGS+=' -std=c++11'
  ./configure --prefix=/usr \
              --disable-gtkglext-test \
              --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
