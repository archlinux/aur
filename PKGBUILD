# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-starlink-ast'
pkgver='3.01'
pkgrel='5'
pkgdesc="Interface to the Starlink AST library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-pgplot' 'perl-tk' 'perl-tk-zinc')
makedepends=('perl-module-build')
checkdepends=('perl-test-deep>=0' 'perl-test-number-delta>=0')
url='https://metacpan.org/release/Starlink-AST'
source=("http://search.cpan.org/CPAN/authors/id/G/GS/GSB/Starlink-AST-${pkgver}.tar.gz")
md5sums=('db53bc018bd349e3a0c85bd8c6883f3c')
sha512sums=('0beddc6c7c76f260725aa0958b2c82c2496b80c94529fca37e912493d45b09a07494f2b1bb3b0eb0ca99f61c6f415a6671240e9e69a8bef166d6b1591a00ddcf')
_distdir="Starlink-AST-${pkgver}"



build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    # lib/Starlink/AST.xs in version 3.01 has some unlucky parts where the default "-Werror=format-security" in Perl's Config.pm errors out.
    /usr/bin/perl Build --config optimize="${CFLAGS} -W'no-error=format-security'"
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
