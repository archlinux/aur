# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_distname=Dist-Zilla-Plugin-CheckChangeLog
pkgname=perl-dist-zilla-plugin-checkchangelog
pkgver=0.05
pkgrel=1
pkgdesc="Dist::Zilla with Changes check"
arch=('any')
url="http://search.cpan.org/dist/$_distname"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.004'
         'perl-dist-zilla>=6.005'
         'perl-path-class>=0'
         'perl-pod-markdown>=0')
makedepends=()
checkdepends=('perl-pod-coverage>=0'
              'perl-pod-coverage-trustpod>=0'
              'perl-test-exception>=0.43'
              'perl-test-pod>=0'
              'perl-test-pod-coverage>=0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/F/FA/FAYLAND/$_distname-$pkgver.tar.gz")
md5sums=('1c0c8e2c7887d2dbbbd760bed69cbed4')

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
