# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname='perl-data-float'
_dist='Data-Float'
pkgver='0.014'
pkgrel='1'
pkgdesc="Contains the Data::Float module, native floating point numerical data type"
arch=('x86_64' 'armv7h' 'aarch64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url="https://metacpan.org/release/$_dist"
source=("https://cpan.metacpan.org/authors/id/R/RR/RRWO/$_dist-$pkgver.tar.gz")
md5sums=('b7a0f112aced16612e777af2d2c9de55')
sha512sums=('853fd703f05e1c20ed89379b461ebe7ef6df277ba8b9c9b2967a2969d5db4dd2a4dbe1df98c8a6e0a8356b57b7e750fb95b960d9dd92c62b8bdf2951b87a8369')
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
