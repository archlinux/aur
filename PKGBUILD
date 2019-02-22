# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-pod-projectdocs'
pkgver='0.52'
pkgrel='1'
pkgdesc="generates CPAN like pod pages"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0' 'perl-class-data-inheritable>=0' 'perl-json>=2.04' 'perl-readonly>=0' 'perl-template-toolkit>=0' 'perl-uri>=0' 'perl-moose>=0')
makedepends=()
url='https://metacpan.org/release/Pod-ProjectDocs'
source=("http://search.cpan.org/CPAN/authors/id/M/MG/MGRUNER/Pod-ProjectDocs-${pkgver}.tar.gz")
md5sums=('b093812412b361085785d059615a396a')
sha512sums=('a5f15deb9c72a759412edf3c46fd395fd7a36457c7a87418efcefd9a29cc9905368541818672e6dcae73aed8f3f858e382ba42b276e4299dee8a612d76bd2a90')
_distdir="Pod-ProjectDocs-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
