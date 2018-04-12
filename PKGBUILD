# Maintainer: kpcyrd <git@rxv.cc>

pkgbase=open-cobol
pkgname=('open-cobol' 'libcob')
pkgver=1.1
pkgrel=2
pkgdesc="COBOL compiler"
url="http://www.opencobol.org/"
arch=('i686' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/open-cobol/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz/download")
md5sums=('e38c898e01d50a7ca6bb3e41cfcb0c64')
sha256sums=('6ae7c02eb8622c4ad55097990e9b1688a151254407943f246631d02655aec320')

build() {
  cd "$pkgbase-$pkgver"
  ./configure --prefix=/usr --infodir=/usr/share/info
  make
}

package_open-cobol() {
  depends=('bash' 'libcob')
  license=('GPL2')

  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/include" "$pkgdir/usr/lib"
  install -Dm644 COPYING.LIB "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_libcob() {
  pkgdesc+=" (runtime library)"
  depends=('gmp' 'db')
  license=('LGPL2.1')

  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/bin" "$pkgdir/usr/share"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
