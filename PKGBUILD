# Maintainer: xeruf <27jf at pm dot me>
_pkgname=Text-Layout
pkgname=perl-text-layout
pkgver=0.030
pkgrel=1
pkgdesc="Pango style markup formatting"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=()
url='https://metacpan.org/pod/Text::Layout'
source=("https://cpan.metacpan.org/authors/id/J/JV/JV/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('6b32763f160880b7a43974f6de672912282f5746b965c246bdeee7c4e6839fc364cc0db1b37b4d1b1acbf66f77e8df424cf5c163573051a01a628d3d7e2f73e7')
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
