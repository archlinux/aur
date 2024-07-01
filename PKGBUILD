# Maintainer: René Wagner <rwagner at rw-net dot de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-cups'
pkgver='0.64'
pkgrel='2'
pkgdesc="Common Unix Printing System Interface"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'e2fsprogs>=1.43.4' 'glibc>=2.25' 'krb5>=1.13.7' 'libcups>=2.2.3' 'zlib>=1:1.2.11' 'cups-filters')
makedepends=()
url='https://metacpan.org/release/Net-CUPS'
source=('http://search.cpan.org/CPAN/authors/id/N/NI/NINE/Net-CUPS-0.64.tar.gz')
sha256sums=('d7bc77ff0f62bf874c843c590eb12a80bbd44749a2fb74dbed445c35d0e85a85')
_distdir="Net-CUPS-0.64"

prepare() {
  cd "$srcdir/$_distdir"
  # Replace all instances of CUPS_IMAGE_ with CF_IMAGE_ in the source files
  find . -type f -exec sed -i 's/CUPS_IMAGE_/CF_IMAGE_/g' {} +
}

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

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
