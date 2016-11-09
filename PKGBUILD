# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-file-map'
pkgver='0.64'
pkgrel='1'
pkgdesc="Memory mapping made simple and safe."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0.28' 'perl-perlio-layers>=0' 'perl-sub-exporter-progressive>=0.001005' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-fatal>=0' 'perl-test-warnings>=0.005')
url='https://metacpan.org/release/File-Map'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/File-Map-0.64.tar.gz')
md5sums=('83445eda69ea0b79abaeab7950506283')
sha512sums=('dc1182e79d20e835e19c78f5187dd108b45938209933a7074674d472ac300277fc1fb7604b023ad7d3456ef5837bb8274a94e1cac79f95f2a2235855c59d3809')
_distdir="File-Map-0.64"

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
