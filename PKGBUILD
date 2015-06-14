# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

_author='R/RS/RSCHUPP'
_perlmod=PAR
pkgname=perl-par
pkgver=1.009
pkgrel=1
pkgdesc="Perl Archive Toolkit"
arch=('any')
url="http://search.cpan.org/~rschupp/PAR"
license=('GPL' 'PerlArtistic')
depends=('perl-archive-zip' 'perl-par-dist')
provides=(
perl-par-heavy
perl-par-setupprogname
perl-par-setuptemp
)
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('c809acc253d98fe37b6dacd790f8a63315845d873a6b1bc9f2580e709eaccb21')
build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  /usr/bin/perl Makefile.PL
  make
}
check(){
  cd "$srcdir/$_perlmod-$pkgver"
  make test
}
package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
