# Maintainer: Flammkuchen <aur at bbirkner dot de>
_pkgname=HarfBuzz-Shaper
pkgname=perl-harfbuzz-shaper
pkgver=0.033
pkgrel=1
pkgdesc="Use HarfBuzz for text shaping"
arch=('x86_64')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-text-layout' 'harfbuzz')
url='https://metacpan.org/pod/HarfBuzz::Shaper'
source=("https://cpan.metacpan.org/authors/id/J/JV/JV/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('d08719fd0069f67a48908ebf7608e19fabe527fd95f3afea8f1954722ada960c489a5445b9d596cc4b61ed4ee26dad0371297ec6d8a965097445f4ce07cd4b5d')
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
