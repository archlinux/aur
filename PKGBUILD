# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_distname=Dist-Zilla-Plugin-Test-DistManifest
pkgname=perl-dist-zilla-plugin-test-distmanifest
pkgver=2.000005
pkgrel=1
pkgdesc="Release tests for the manifest"
arch=('any')
url="https://metacpan.org/release/$_distname"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.008'
         'perl-dist-zilla>=0'
         'perl-moose>=0'
         'perl-test-distmanifest>=0')
makedepends=()
checkdepends=('perl-test-output>=0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/D/DO/DOHERTY/$_distname-$pkgver.tar.gz")
md5sums=('3e3e7b799c71179d1dd6cc691a47a604')

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
