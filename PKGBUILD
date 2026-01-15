# Maintainer: Flammkuchen <aur at bbirkner dot de>
_pkgname=HarfBuzz-Shaper
pkgname=perl-harfbuzz-shaper
pkgver=0.032
pkgrel=3
pkgdesc="Use HarfBuzz for text shaping"
arch=('x86_64')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-text-layout' 'harfbuzz')
url='https://metacpan.org/pod/HarfBuzz::Shaper'
source=("https://cpan.metacpan.org/authors/id/J/JV/JV/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('4e7be5855da2cd3f86a3a5969015e572df238994ee07cc5fcde3edfaa44a71e852019d0fe3c7a83058038c864435af42047897d8f0a003b8614eef6479da43b1')
_distdir="${_pkgname}-${pkgver}"

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
