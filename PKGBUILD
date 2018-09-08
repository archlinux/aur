# Maintainer: Michael Gerdau <mgd@qata.de>
# Maintainer: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: Caleb Cushing AKA xenoterracide <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cpanplus-dist-build'
pkgver='0.90'
pkgrel='1'
pkgdesc="CPANPLUS plugin to install packages that use Build.PL"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpanplus>=0.84' 'perl-module-build>=0.32' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/CPANPLUS-Dist-Build'
source=("http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/CPANPLUS-Dist-Build-${pkgver}.tar.gz")
md5sums=('1fbf2c087bbe10a4c1536b415e45c960')
sha512sums=('5dece7c1ac988fdaf20ce796baf1707be9a653a93822987803f58eee534b8dfafe52152b0236d26c0f7162f61e0348f0fb0a59f76cf3873b01059b12a8a89913')
_distdir="CPANPLUS-Dist-Build-${pkgver}"

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
