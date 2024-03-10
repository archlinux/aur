# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname='perl-astro-fits-header'
pkgver='3.09'
pkgrel='2'
pkgdesc="Object Orientated interface to FITS HDUs"
arch=('any')
license=('GPL-3.0-or-later')
options=('!emptydirs')
depends=('perl-astro-fits-cfitsio')
makedepends=('perl-module-build')
optdepends=('perl-starlink-ast: needed for Astro::FITS::Header::AST')
checkdepends=('perl-starlink-ast')
# Astro::FITS::Header::GSD and Astro::FITS::Header::NDF require perl-GSD and perl-NDF respectively
# These are not package on AUR and I couldn't find them on CPAN either, only GH repos
# https://github.com/Starlink/perl-GSD
# https://github.com/Starlink/perl-NDF
url='https://metacpan.org/release/Astro-FITS-Header'
source=("http://search.cpan.org/CPAN/authors/id/G/GS/GSB/Astro-FITS-Header-${pkgver}.tar.gz")
md5sums=('a473158b9fb4328d328023b2876643d5')
sha512sums=('ab02183101b507e5094005c0c633641d26071ca4e3adbc6e362a28ce0ff568745b21e2d5818033185f5c6732592d35843ba20b4d135b525338185c5a7e33d926')
_distdir="Astro-FITS-Header-${pkgver}"

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

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
