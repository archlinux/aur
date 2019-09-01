# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>

pkgname=pynac-python3
pkgver=0.7.26
pkgrel=1
pkgdesc="Python 3 version of GiNaC, a C++ library for symbolic mathematical calculations"
arch=(x86_64)
url="http://pynac.org"
license=(GPL)
depends=(python singular) # giac disabled because of https://trac.sagemath.org/ticket/26427
conflicts=(pynac)
source=("https://github.com/pynac/pynac/releases/download/pynac-$pkgver/pynac-$pkgver.tar.bz2")
sha256sums=('cc124ae9757355e3434ff864aeca6503184faf0642d26bc2f7bca6f3f2c9b50f')

build() {
  cd pynac-$pkgver

  ./configure --prefix=/usr
  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd pynac-$pkgver
  make DESTDIR="$pkgdir" install
}
