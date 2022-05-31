# Maintainer: jose riha <jose 1711 gmail com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-tinkerforge
pkgver=2.1.31
pkgrel=1
pkgdesc="perl binding for the TinkerForge hard-/software"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://www.tinkerforge.com/en/doc/Software/API_Bindings_Perl.html'
source=("http://download.tinkerforge.com/bindings/perl/tinkerforge_perl_bindings_${pkgver//./_}.zip")
md5sums=('202cbf5c1678707f9be155f5cbb1ce52')
sha512sums=('85f29551b7c219573385a8cc420c1f76804ef3c5c1c1f3aa066e5f07cecd580ac35232a440fc6d225c086dc9e80768f901f7754938bd4311679d81d83a687afd')
_distdir="Tinkerforge-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/source"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/source"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/source"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
