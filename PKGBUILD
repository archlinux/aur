# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-catalyst-view-tt'
_pkgname='Catalyst-View-TT'
pkgver='0.41'
pkgrel='1'
pkgdesc="Helper for TT Views"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-catalyst-runtime>=5.7' 'perl-class-accessor' 'perl-mro-compat' 'perl-path-class' 'perl-template-toolkit' 'perl-template-timer')
makedepends=('perl-extutils-makemaker>=6.59')
url="http://search.cpan.org/dist/Catalyst-View-TT"
source=("http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/${_pkgname}-${pkgver}.tar.gz")
md5sums=('1eb23e4604598912a38d6116974737c9')
sha512sums=('4715269d812c8f85056965dd018e65f38e6f8e4da0fff2303381fb9dfdfa3ddd62dabd945f49d88c26514fae054b1ec3a0f10037532606489a17bcb7a116ced6')

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
