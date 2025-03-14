# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious-plugin-authorization'
pkgver='1.06'
pkgrel='2'
pkgdesc="A plugin to make Authorization a bit easier"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-module-build>=0.38' 'perl-mojolicious>=0')
makedepends=()
checkdepends=('perl-test-deep>=0.113' 'perl-test-exception>=0.32')
url='https://metacpan.org/release/Mojolicious-Plugin-Authorization'
source=("http://search.cpan.org/CPAN/authors/id/B/BY/BYTEROCK/Mojolicious-Plugin-Authorization-${pkgver}.tar.gz"
        'fix_tests.patch'::'https://patch-diff.githubusercontent.com/raw/byterock/mojolicious-plugin-authorization/pull/21.patch')
md5sums=('7906886e2a66b84bb3c0edd7ea85c485'
         'f33e2e30d5a1a1c62423923faab7d268')
sha512sums=('82dbf201bc5d9e9912dd1e522e2fde225f54befbc024c07757ee2ddeb56e5131300672a18aafaf60df2ab00c724c55f56b35fdafd96936f54360a143f102f688'
            '57347e9384e3861a4e6c6761a5490b08eab0c59fed98ad899676501f3f3e8bc63817c9ef0f81221c9913f003e9fe578351b0ef27583c2224f6df3e706cd13aac')
_distdir="Mojolicious-Plugin-Authorization-${pkgver}"

prepare() {
    cd "$srcdir/$_distdir"
    patch -Np1 < "../fix_tests.patch"
}

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
