# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>

pkgname=necpp
pkgver=1.6.1
pkgrel=1
pkgdesc="Free NEC-2 compatable electromagnetic code. With C, C++ APIs."
arch=('i686' 'x86_64')
url="http://elec.otago.ac.nz/w/index.php/Necpp"
license=('GPL')
depends=('gcc-libs')
options=(!libtool)
source=("necpp-$pkgver.tgz::https://github.com/tmolteno/necpp/archive/v$pkgver.tar.gz"
        "warnings.diff")
md5sums=('a498fee8642bf60bbba3586a6ae18fec'
         '45801970e5c2b44e24ce5980cefb2969')

# todo: python bindings, ruby bindings

prepare() {
  cd "necpp-$pkgver"
  #sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.in
  cd src
  patch -Np1 -i "$srcdir/warnings.diff"
  sed -i 's/(abs/(fabs/' c_evlcom_tb.cpp
}

build() {
  cd "necpp-$pkgver"
  make -f Makefile.git
  ./configure --prefix=/usr --without-lapack
  make
}

package() {
  cd "necpp-$pkgver"
  make DESTDIR="${pkgdir}/" install
}
