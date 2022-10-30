# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-cpan-outdated'
pkgver='0.32'
pkgrel='1'
pkgdesc="detect outdated CPAN modules in your environment."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-distnameinfo' 'perl-uri' 'perl-libwww' 'perl-local-lib')
makedepends=('perl-module-build-tiny')
url='http://search.mcpan.org/dist/cpan-outdated'
source=('https://cpan.metacpan.org/authors/id/D/DO/DOLMEN/cpan-outdated-0.32.tar.gz')
md5sums=('5aef4148c9d5d592414105bef8249271')
_distdir="cpan-outdated-0.32"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
