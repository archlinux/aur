# Maintainer: Pavel Pletenev <cpp.create at gmail dot com>
pkgname=vnlog
pkgver=1.19
pkgrel=2
pkgdesc="Tools to manipulate whitespace-separated ASCII logs"
arch=('x86_64')
url="https://github.com/dkogan/vnlog"
license=('GPL')
depends=('perl' 'python')
makedepends=('chrpath' 'make')
provides=('vnlog')
source=("https://github.com/dkogan/vnlog/archive/v${pkgver}.tar.gz")
sha256sums=("1f8c95739290d0030cf927319b087dc37fb9c33d5fa8f034a71924bc8a3d4b80")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
  mkdir "$pkgdir/usr/share/perl5/vendor_perl"
  mv "$pkgdir/usr/share/perl5/Vnlog" "$pkgdir/usr/share/perl5/vendor_perl"
  mv "$pkgdir/usr/lib/python2.7/dist-packages" "$pkgdir/usr/lib/python2.7/site-packages"
  mv "$pkgdir/usr/lib/python3/dist-packages" "$pkgdir/usr/lib/python3/site-packages"
  PYV=`python3 -c 'import sys; print(sys.version[:3])'`
  mv "$pkgdir/usr/lib/python3" "$pkgdir/usr/lib/python$PYV"
}

