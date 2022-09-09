# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname='perl-astro-fits-header'
pkgver='3.08'
pkgrel='3'
pkgdesc="Object Orientated interface to FITS HDUs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-astro-fits-cfitsio')
makedepends=('perl-module-build')
optdepends=('perl-starlink-ast: needed for Astro::FITS::Header::AST')
# Astro::FITS::Header::GSD and Astro::FITS::Header::NDF require perl-GSD and perl-NDF respectively
# These are not package on AUR and I couldn't find them on CPAN either, only GH repos
# https://github.com/Starlink/perl-GSD
# https://github.com/Starlink/perl-NDF
url='https://metacpan.org/release/Astro-FITS-Header'
source=("http://search.cpan.org/CPAN/authors/id/G/GS/GSB/Astro-FITS-Header-${pkgver}.tar.gz")
md5sums=('dc62a668e29278bb5f0d02e26071b644')
sha512sums=('c94a9da46212a2db95c1ce32da2609869bc85687c236919791c16b06f1787311ee3ac3323baece790c04d56818754c6f487b15c20487ded9ebe61bf97cc11c29')
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
