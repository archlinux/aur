pkgname='perl-module-install-autolicense'
pkgver='0.08'
pkgrel="2"
pkgdesc="A Module::Install extension to automagically generate LICENSE files"
arch=('any')
license=('PerlArtistic')
options=('!emptydirs')
depends=('perl' 'perl-capture-tiny' 'perl-software-license' 'perl-module-install')
url='http://search.cpan.org/dist/Module-Install-AutoLicense'
source=("http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/Module-Install-AutoLicense-${pkgver}.tar.gz")
md5sums=('1bdc939ddf41388ee6893f1339726d09')
sha512sums=('35b0251d1b40ecc3610ef17551231764a4a60f36d09399cad3e06722d6dbff60a5ffe54719e9e24ee9712570c16f372deb54032866941fe58d5f9be8f0cb4f8e')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd ${srcdir}/Module-Install-AutoLicense-${pkgver}
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd ${srcdir}/Module-Install-AutoLicense-${pkgver}
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd ${srcdir}/Module-Install-AutoLicense-${pkgver}
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
