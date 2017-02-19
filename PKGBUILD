pkgname='perl-module-install-autolicense'
pkgver='0.10'
pkgrel='1'
pkgdesc="A Module::Install extension to automagically generate LICENSE files"
arch=('any')
license=('PerlArtistic')
options=('!emptydirs')
depends=('perl-module-install>=0.85' 'perl-software-license>=0.01')
makedepends=('perl-capture-tiny>=0.05')
url='http://search.cpan.org/dist/Module-Install-AutoLicense'
source=("https://cpan.metacpan.org/authors/id/B/BI/BINGOS/Module-Install-AutoLicense-${pkgver}.tar.gz")
md5sums=('8f512b023223e3221e1848a4b95ba21f')
sha512sums=('6d631184b90fd2f4c969f61887c4143962b2d292d73de91b0fe06b6d4495764d7b42c5701e6fe0f946751cc2deeffc67567f9ebbb2f37bf067e4e489251e45ee')

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
