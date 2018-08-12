# Maintainer: Cody Schafer <dev@codyps.com>

pkgname=hcxtools
pkgdesc="Portable solution for capturing wlan traffic and conversion to hashcat and jtr formats"
license=('MIT')
arch=('i686' 'x86_64')

pkgver=4.2.1
pkgrel=2

url="https://github.com/ZerBea/$pkgname"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ZerBea/$pkgname/archive/$pkgver.tar.gz")

sha384sums=('722db9ab11df74f33144a68e258175ca7f80bfa0cd42aa8f8bb6ca36bafd670ec677482d412a4b71fc07499473fff7f2')

makedepends=('make' 'gcc')

depends=('curl' 'libpcap' 'zlib' 'openssl')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  rm -f build
  make DESTDIR=$pkgdir PREFIX=/usr INSTALLDIR=$pkgdir/usr/bin
  touch build
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir PREFIX=/usr INSTALLDIR=$pkgdir/usr/bin install

  for _docfile in README.md changelog; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${pkgname}/${_docfile}"
  done
  
  install -D -v -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
