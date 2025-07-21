# Maintainer: Flammkuchen <aur at bbirkner dot de>
# Contributor: xeruf <27jf at pm dot me>
_pkgname=Text-Layout
pkgname=perl-text-layout
pkgver=0.045
pkgrel=2
pkgdesc="Pango style markup formatting"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=('perl-pdf-api2' 'perl-object-pad')
url='https://metacpan.org/pod/Text::Layout'
source=("https://cpan.metacpan.org/authors/id/J/JV/JV/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('f7fc0b01ccd2d6dc856ec7b24a689ffdeb15569fa65feec6ac8af29060d59aa61b65da77046ec91abde982984ac9909f2c5fd5ab650442412f48443e530001b2')
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
