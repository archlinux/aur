# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-catalyst-devel'
pkgver='1.39'
pkgrel='1'
pkgdesc="Catalyst Development Tools"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-action-renderview>=0.10' 'perl-catalyst-plugin-configloader>=0.30' 'perl-catalyst-plugin-static-simple>=0.28' 'perl-catalyst-runtime' 'perl-config-general>=2.42' 'perl-file-changenotify>=0.07' 'perl-file-copy-recursive' 'perl-file-sharedir' 'perl-module-install>=1.02' 'perl-moose' 'perl-moosex-daemonize' 'perl-moosex-emulate-class-accessor-fast' 'perl-namespace-autoclean' 'perl-namespace-clean' 'perl-path-class>=0.09' 'perl-starman' 'perl-template-toolkit')
makedepends=('perl-test-fatal>=0.003')
url='http://search.cpan.org/dist/Catalyst-Devel'
source=("http://search.cpan.org/CPAN/authors/id/I/IL/ILMARI/Catalyst-Devel-${pkgver}.tar.gz")
md5sums=('d4cd43379ffc981e43a5e440adcadd04')
sha512sums=('3f13ba85cab764b869953915bf1846e4cc2919aacc4038fdb9b90543e5ea77ee8edd8d88ef4f063af2c3089a275b16f37daa2d72d7d4454958cb34c16113d90d')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/Catalyst-Devel-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/Catalyst-Devel-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/Catalyst-Devel-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
