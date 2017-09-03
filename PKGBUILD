# Contributor: mober <maxATmoberDOTat>

pkgname=perl-device-smbus
pkgver=1.15
pkgrel=1
pkgdesc='This packages the SMBus distribution, containing the Device::SMBus module!'
_dist=Device-SMBus
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'i2c-tools')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/S/SH/SHANTANU/$_dist-$pkgver.tar.gz")
md5sums=('01138616deda09b8897dbc92a24a4374')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
