# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgbase=libpcap++
pkgname=('libpcappp' 'libpcappp-doc-html' 'libpcappp-doc-qt')
pkgver=0.0.2
pkgrel=3
arch=(i686 x86_64)
url="http://libpcappp.sourceforge.net/"
license=('GPL2')
makedepends=('doxygen')
source=("http://downloads.sourceforge.net/libpcappp/$pkgbase-$pkgver.tar.gz"
        "fix.patch")
sha256sums=('92240a42de09e847b315a5205f791252e9498e7fe1304d6e852e41655d6ae26a'
            '77a28d2fa39ba1deffefdf56dadb3a04962565884248a11576a2b34e9eed176d')

prepare() {
  cd "$srcdir/$pkgbase-$pkgver"
  patch -p1 -i ../fix.patch
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  make
}

package_libpcappp() {
  pkgdesc="C++ wrapper for libpcap"
  depends=('libpcap>=0.8')

  cd "$pkgbase-$pkgver/pcap++"
  make DESTDIR="$pkgdir" install
  cd ..
  make DESTDIR="$pkgdir" install-pkgconfigDATA
}

package_libpcappp-doc-html() {
  pkgdesc="C++ wrapper for libpcap - html documantation"
  arch=(any)

  mkdir -p "$pkgdir/usr/share/doc/$pkgbase"
  cp -r "$pkgbase-$pkgver/doc/html/"* "$pkgdir/usr/share/doc/libpcap++/"
}

package_libpcappp-doc-qt() {
  pkgdesc="C++ wrapper for libpcap - documantation for qt help"
  arch=(any)

  mkdir -p "$pkgdir/usr/share/doc/qt"
  cp "$pkgbase-$pkgver/doc/qch/libpcap++-0.0.2.qch" "$pkgdir/usr/share/doc/qt"
}
