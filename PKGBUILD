# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname='perl-data-float'
_dist='Data-Float'
pkgver='0.015'
pkgrel='1'
pkgdesc="Contains the Data::Float module, native floating point numerical data type"
arch=('x86_64' 'armv7h' 'aarch64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url="https://metacpan.org/release/$_dist"
source=("https://cpan.metacpan.org/authors/id/R/RR/RRWO/$_dist-$pkgver.tar.gz")
md5sums=('6d83c3e1987229756cd00afb58d784cf')
sha512sums=('9a757a2398e7213ea172ab444de0aa1d06ee69d5d2447e8cd071ee8c2a8749ce4ee8616e479d0bf4c42e2db6acdf2bb3c80c82c0a28b28c54d38021239672515')
_distdir="$_dist-$pkgver"

build() {
  cd "$srcdir/$_distdir"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_distdir"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"

#  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
