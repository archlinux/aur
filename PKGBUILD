# Maintainer: Flammkuchen <aur at bbirkner dot de>
_pkgname=HarfBuzz-Shaper
pkgname=perl-harfbuzz-shaper
pkgver=0.031
pkgrel=3
pkgdesc="Use HarfBuzz for text shaping"
arch=('x86_64')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-text-layout' 'harfbuzz')
url='https://metacpan.org/pod/HarfBuzz::Shaper'
source=("https://cpan.metacpan.org/authors/id/J/JV/JV/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('02bb1e55a725999d002ef9a204504f4aca3c375cf1a08278ad30518de2a977a857f176de36bbc172ffc950ba3bdfc156f1d1728795588f2be5c3c6dd8d0abd26')
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
