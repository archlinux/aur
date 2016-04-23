# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-kephra'
pkgver='0.4.3.34'
pkgrel='1'
pkgdesc="crossplatform GUI-Texteditor along Perl alike Paradigms"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-config-general' 'perl-file-userconfig' 'perl-wx>=0.74' 'perl-wx-perl-processstream' 'perl-yaml-tiny' 'perl>=5.6.0')
makedepends=()
checkdepends=('perl-test-checkmanifest>=0.9' 'perl-test-exception' 'perl-test-nowarnings' 'perl-test-pod>=1.22' 'perl-test-script' 'xorg-server-xvfb')
url='https://metacpan.org/release/Kephra'
source=('http://search.cpan.org/CPAN/authors/id/L/LI/LICHTKIND/Kephra-0.4.3.34.tar.gz')
md5sums=('45b9dd59b28ec88aa32a72e81b03502d')
sha512sums=('1d8969d32af8680d219a395a2b82c28d36542407000cdd66e765ff9709c16accb0008b1d4018b6cb3d2469c2ceb5c10e285d08869c6b8812de85fdd2925d839b')
_distdir="Kephra"

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
    xvfb-run -a -s "+extension GLX -screen 0 1280x1024x24" make test
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
