# Maintainer: Pavel Pletenev <cpp.create at gmail dot com>
pkgname=vnlog
pkgver=1.36
pkgrel=1
pkgdesc="Tools to manipulate whitespace-separated ASCII logs"
arch=('x86_64')
url="https://github.com/dkogan/vnlog"
license=('GPL')
depends=('perl' 'python' 'glibc' 'python-numpy')
makedepends=('mrbuild' 'make')
provides=('vnlog')
source=("https://github.com/dkogan/vnlog/archive/v${pkgver}.tar.gz")
sha256sums=('7adb33443b8b21a8fa733c98700c55086f8b8d7fa9a6e0decef605fe4d82edb8')

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
  mkdir "$pkgdir/usr/share/perl5/vendor_perl"
  mv "$pkgdir/usr/share/perl5/Vnlog" "$pkgdir/usr/share/perl5/vendor_perl"
}
