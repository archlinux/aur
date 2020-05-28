# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_distname=Dist-Zilla
pkgname=perl-dist-zilla
pkgver=6.014
pkgrel=1
pkgdesc="distribution builder; installer not included!"
arch=('any')
url="https://metacpan.org/release/$_distname"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.14.0'
         'perl-app-cmd>=0'
         'perl-cpan-meta-check>=0.011'
         'perl-cpan-uploader>=0.103004'
         'perl-class-load>=0.17'
         'perl-config-ini>=0'
         'perl-config-mvp>=2.200011'
         'perl-config-mvp-reader-ini>=2.101461'
         'perl-data-section>=0.200002'
         'perl-datetime>=0.44'
         'perl-file-copy-recursive>=0.41'
         'perl-file-find-rule>=0'
         'perl-file-sharedir>=0'
         'perl-file-sharedir-install>=0.03'
         'perl-file-pushd>=0'
         'perl-json-maybexs>=0'
         'perl-log-dispatchouli>=1.102220'
         'perl-mixin-linewise>=0'
         'perl-module-runtime>=0'
         'perl-moose>=0.92'
         'perl-moosex-lazyrequire>=0'
         'perl-moosex-role-parameterized>=1.01'
         'perl-moosex-setonce>=0'
         'perl-moosex-types>=0'
         'perl-moosex-types-perl>=0'
         'perl-ppi>=0'
         'perl-params-util>=0'
         'perl-path-tiny>=0.052'
         'perl-perl-prereqscanner>=1.016'
         'perl-software-license>=0.103014'
         'perl-string-formatter>=0.100680'
         'perl-string-rewriteprefix>=0.006'
         'perl-sub-exporter>=0'
         'perl-sub-exporter-formethods>=0'
         'perl-term-encoding>=0'
         'perl-term-ui>=0'
         'perl-term-readkey>=0'
         'perl-text-glob>=0.08'
         'perl-text-template>=0'
         'perl-try-tiny>=0'
         'perl-yaml-tiny>=0'
         'perl-namespace-autoclean>=0')
makedepends=()
checkdepends=('perl-test-deep>=0'
              'perl-test-failwarnings>=0'
              'perl-test-fatal>=0'
              'perl-test-file-sharedir>=0')
optdepends=('perl-archive-tar-wrapper>=0.15: API wrapper around the tar utility'
            'perl-data-optlist>=0.110: Parse and validate simple name/value option pairs'
            'perl-ppi-xs>=0: Minor XS acceleration for PPI'
            'perl-term-readline-gnu>=0: GNU Readline XS library wrapper')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/$_distname-$pkgver.tar.gz")
md5sums=('1125080dd71eb2f9d07a873e958235a8')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distname-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distname-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distname-$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
