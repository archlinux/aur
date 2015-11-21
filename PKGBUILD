# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=perl-db-color
pkgver=0.20
pkgrel=1
_author="O/OV/OVID"
_perlmod="DB-Color"
pkgdesc="DB::Color - Colorize your debugger output"
arch=('any')
url="https://metacpan.org/pod/DB::Color"
license=('GPL' 'PerlArtistic')
depends=(perl)
provides=(
perl-db-color-config
perl-db-color-highlight
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('8fef6afe5ac3e3e245d5a36f8ba28a8a8b5c9552cc31b5c0976013b6f02bca4d')
build(){
  cd "$srcdir"/$_perlmod-$pkgver

  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  /usr/bin/perl Makefile.PL
  make
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver

  make test
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver

  make install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
