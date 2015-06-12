# Maintainer: jose riha <jose 1711 gmail com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-tinkerforge'
pkgver='2.0.2'
pkgrel='1'
pkgdesc="perl binding for the TinkerForge hard-/software"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
url='http://www.tinkerforge.com/en/doc/Software/API_Bindings_Perl.html'
source=("http://download.tinkerforge.com/bindings/perl/tinkerforge_perl_bindings_2_0_2.zip")
md5sums=('3666ba2e405565371f252ecb5adddfe5')
sha512sums=('4aea8254b4d800171b115bc8fdecb4692baa1b2f7e6741986d6ad75f08a104fb2a67937af78a2fb24c2903a0da76130a4440a7af48ce9870f51f38d65b5ff415')
_distdir="Tinkerforge-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir"
    tar xzf Tinkerforge.tar.gz
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
