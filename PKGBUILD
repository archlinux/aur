# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-datetime-format-natural'
pkgver='1.16'
pkgrel='1'
pkgdesc="Parse informal natural language date/time strings"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone' 'perl-datetime' 'perl-datetime-hires' 'perl-boolean')
makedepends=('perl-module-build')
checkdepends=('perl-module-util' 'perl-test-mocktime-hires')
url='https://metacpan.org/dist/DateTime-Format-Natural'
source=('https://cpan.metacpan.org/authors/id/S/SC/SCHUBIGER/DateTime-Format-Natural-1.16.tar.gz')
md5sums=('cd2d34fd04ffa4473ad37a944e7fbd2f')
_distdir="DateTime-Format-Natural-1.16"

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
    unset DISPLAY
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

