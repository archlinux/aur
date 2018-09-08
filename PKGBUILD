# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_distname=Dist-Zilla-Plugin-CheckChangesHasContent
pkgname=perl-dist-zilla-plugin-checkchangeshascontent
pkgver=0.011
pkgrel=1
pkgdesc="Ensure Changes has content before releasing"
arch=('any')
url="http://search.cpan.org/dist/$_distname"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.006'
         'perl-capture-tiny>=0'
         'perl-data-section>=0.200002'
         'perl-dist-zilla>=6'
         'perl-moose>=2'
         'perl-path-tiny>=0'
         'perl-sub-exporter-formethods>=0'
         'perl-namespace-autoclean>=0.28')
makedepends=()
checkdepends=('perl-test-fatal>=0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/$_distname-$pkgver.tar.gz")
md5sums=('9d9c660042b546304486f77121df339a')

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
