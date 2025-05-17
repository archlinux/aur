# Maintainer: Flammkuchen <aur at bbirkner dot de>
# Contributor: xeruf <27jf at pm dot me>
_pkgname=Text-Layout
pkgname=perl-text-layout
pkgver=0.044
pkgrel=1
pkgdesc="Pango style markup formatting"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=('perl-pdf-api2' 'perl-object-pad')
url='https://metacpan.org/pod/Text::Layout'
source=("https://cpan.metacpan.org/authors/id/J/JV/JV/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('d3768b8a16cfd252c25845ef5aa1ddc4016fdf9ee6101390147756e27bc626a708ccf28b4aa42c62e5e93c78818ee5dd8dfa79bd05252daa4e16e438d995eb6e')
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
