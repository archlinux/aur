# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-moosex-types-path-class'
_pkgname='MooseX-Types-Path-Class'
pkgver='0.06'
pkgrel='2'
pkgdesc="A Path::Class type library for Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.39' 'perl-moosex-types>=0.04' 'perl-path-class>=0.16')
makedepends=('perl-extutils-makemaker>=6.30')
url="http://search.cpan.org/dist/MooseX-Types-Path-Class"
source=("http://search.cpan.org/CPAN/authors/id/T/TH/THEPLER/${_pkgname}-${pkgver}.tar.gz")
md5sums=('8b98dcc6ef5d056781162c9e14a8e94d')
sha512sums=('93cd8760f9f87c18b7ffce54ef60cf208c923e2d8da341c4a0d5c79e34e526d6f0dae407971c9e320d98c5b157ba32145adf22880799cdb670860b39cacd8441')

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
