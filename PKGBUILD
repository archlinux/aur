# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>

pkgname=perl-pdl-io-hdf5
epoch=1
pkgver=0.75
pkgrel=2
pkgdesc='Perl module providing PDL interface to the HDF5 data format'
arch=('i686' 'x86_64')
url='https://metacpan.org/dist/PDL-IO-HDF5'
license=('PerlArtistic' 'GPL')
depends=('perl-pdl' 'hdf5')
makedepends=('perl-pod-parser')
checkdepends=('perl-file-which')
source=(https://cpan.metacpan.org/authors/id/E/ET/ETJ/PDL-IO-HDF5-$pkgver.tar.gz)
options=(!emptydirs)
md5sums=('6c497da659ca929ee78203d63dfe48d4')

build() {
  cd PDL-IO-HDF5-$pkgver
  F77LIBS='-lgfortran -lm' PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor PDLCONF=$srcdir/perldl.conf
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd PDL-IO-HDF5-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd PDL-IO-HDF5-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
