# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-file-map'
pkgver='0.71'
pkgrel='1'
pkgdesc="Memory mapping made simple and safe."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0.4231' 'perl-perlio-layers>=0.012' 'perl-sub-exporter-progressive>=0.001013' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-fatal>=0' 'perl-test-warnings>=0.005')
url='https://metacpan.org/release/File-Map'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/File-Map-${pkgver}.tar.gz")
md5sums=('af467d5449071f61ddcc03bc84ea6e55')
sha512sums=('12c79d0209462b8db629225b565b8366ca14183010a13abe7a93e3c8a4489b29721962ca08fd5b7b8accf9f98506427e3d3dfd4a9da3bcd3127c6316509d4e6f')
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
