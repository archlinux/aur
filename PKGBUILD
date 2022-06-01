# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-file-map'
pkgver='0.67'
pkgrel='3'
pkgdesc="Memory mapping made simple and safe."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0.4231' 'perl-perlio-layers>=0.012' 'perl-sub-exporter-progressive>=0.001013' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-fatal>=0' 'perl-test-warnings>=0.005')
url='https://metacpan.org/release/File-Map'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/File-Map-${pkgver}.tar.gz")
md5sums=('abcc4cbd9a8765b18f8a107859d69df0')
sha512sums=('52bd9ebb546e6b0e0d58cce3e5f5983c0f89bf05ba3f29d220b6d83ca150e200ac9c6e7d2adb717838c0b20e9ddd68c94509b47775d27273c37bc44dcff1d507')
_distdir="File-Map-${pkgver}"

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
