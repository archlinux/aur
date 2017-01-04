# Contributor: Ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-catalyst-view-tt'
_pkgname='Catalyst-View-TT'
pkgver='0.44'
pkgrel='1'
pkgdesc="Helper for TT Views"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-catalyst-runtime>=5.7' 'perl-class-accessor' 'perl-mro-compat' 'perl-path-class' 'perl-template-toolkit' 'perl-template-timer')
makedepends=('perl-extutils-makemaker>=6.59')
url="http://search.cpan.org/dist/${_pkgname}"
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/${_pkgname}-${pkgver}.tar.gz")
md5sums=('0f6b73ea9885ff2839cabf9dbcb91559')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
