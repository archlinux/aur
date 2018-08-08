# Maintainer: Cody Schafer <dev@codyps.com>

pkgname=hcxtools
pkgdesc="Portable solution for capturing wlan traffic and conversion to hashcat and jtr formats"
license=('MIT')
arch=('i686' 'x86_64')

pkgver=4.2.1
pkgrel=1

url="https://github.com/ZerBea/$pkgname"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ZerBea/$pkgname/archive/$pkgver.tar.gz")

md5sums=('6a6ebc3512c849eaba590df481306538')

makedepends=('make' 'gcc')

depends=('curl' 'libpcap' 'zlib' 'openssl')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir PREFIX=/usr INSTALLDIR=$pkgdir/usr/bin install

  for _docfile in README.md changelog; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_bpn}/${_docfile}"
  done
  
  install -D -v -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
