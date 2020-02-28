# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=liblo-ipv6
pkgver=0.31
pkgrel=1
epoch=1
pkgdesc="A lightweight OSC (Open Sound Control) implementation (with IPv6 support)"
arch=('i686' 'x86_64')
url="http://liblo.sourceforge.net/"
license=('GPL')
depends=('glibc')
makedepends=('doxygen')
provides=('liblo' "liblo=$pkgver" 'liblo.so')
conflicts=('liblo')
source=("http://downloads.sourceforge.net/liblo/liblo-$pkgver.tar.gz")
md5sums=('14378c1e74c58e777fbb4fcf33ac5315')


build() {
  cd "$srcdir/liblo-$pkgver"

  ./configure --prefix=/usr --enable-ipv6
  make
}

package() {
  cd "$srcdir/liblo-$pkgver"

  make DESTDIR="$pkgdir" install

  # delete broken man pages
  rm -f doc/man/man3/_*.3

  # man pages
  install -vDm 644 doc/man/man3/*.3 -t "${pkgdir}/usr/share/man/man3"
  # examples
  install -vDm 644 examples/*.{cpp,c} \
    -t "${pkgdir}/usr/share/${_pkgname}/doc/examples/"
  # docs
  install -vDm 644 doc/html/* -t "${pkgdir}/usr/share/doc/${pkgname}/html/"
  install -vDm 644 {AUTHORS,ChangeLog,NEWS,README,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
