# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_distname=Dist-Zilla
pkgname=perl-dist-zilla
pkgver=6.030
pkgrel=1
pkgdesc="distribution builder; installer not included!"
arch=('any')
url="https://metacpan.org/release/$_distname"
license=('PerlArtistic' 'GPL')
depends=('perl'
         'perl-app-cmd'
         'perl-cpan-meta-check'
         'perl-cpan-uploader'
         'perl-class-load'
         'perl-config-ini'
         'perl-config-mvp'
         'perl-config-mvp-reader-ini'
         'perl-data-section'
         'perl-datetime'
         'perl-file-copy-recursive'
         'perl-file-find-rule'
         'perl-file-sharedir'
         'perl-file-sharedir-install'
         'perl-file-pushd'
         'perl-json-maybexs'
         'perl-log-dispatchouli'
         'perl-mixin-linewise'
         'perl-module-runtime'
         'perl-moose'
         'perl-moosex-lazyrequire'
         'perl-moosex-role-parameterized'
         'perl-moosex-setonce'
         'perl-moosex-types'
         'perl-moosex-types-perl'
         'perl-ppi'
         'perl-params-util'
         'perl-path-tiny'
         'perl-perl-prereqscanner'
         'perl-software-license'
         'perl-string-formatter'
         'perl-string-rewriteprefix'
         'perl-sub-exporter'
         'perl-sub-exporter-formethods'
         'perl-term-encoding'
         'perl-term-ui'
         'perl-term-readkey'
         'perl-text-glob'
         'perl-text-template'
         'perl-try-tiny'
         'perl-yaml-tiny'
         'perl-namespace-autoclean')
checkdepends=('perl-test-deep'
              'perl-test-failwarnings'
              'perl-test-fatal'
              'perl-test-file-sharedir')
optdepends=('perl-archive-tar-wrapper: API wrapper around the tar utility'
            'perl-data-optlist: Parse and validate simple name/value option pairs'
            'perl-ppi-xs: Minor XS acceleration for PPI'
            'perl-term-readline-gnu: GNU Readline XS library wrapper')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/$_distname-$pkgver.tar.gz")
md5sums=('0b66401b4ca397c33de47a7fbdc34efd')

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
