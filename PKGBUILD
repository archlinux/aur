# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

_author='R/RS/RSCHUPP'
_perlmod=PAR
pkgname=perl-par
pkgver=1.014
pkgrel=2
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
sha256sums=('a8a6ebb9130e0466fce4eec9db7e666531d25a6eb818eff83963dc685942ed4b')
prepare(){
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null
}
build() {
  cd "$srcdir/$_perlmod-$pkgver"
  perl Makefile.PL
  make
}
check(){
  cd "$srcdir/$_perlmod-$pkgver"
  make test
}
package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
