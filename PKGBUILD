# Contributor: Your Name <youremail@domain.com>
pkgname=perl-authen-sasl-xs
pkgver=1.00
pkgrel=1
pkgdesc='Authen::SASL::XS - XS code to glue Perl SASL to Cyrus SASL'
_dist=Authen-SASL-XS
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-devel-checklib libsasl)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/$_dist-$pkgver.tar.gz")
sha256sums=('1b0eaa0e7ac3a45857147d837e3d34c80c6eca1d9fdcb826a213c2a105454234')

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

# vim: ft=sh:ts=2:sw=2:et:
