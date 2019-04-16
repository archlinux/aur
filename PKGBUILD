# Contributor: ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-app-prt'
pkgver='0.20'
pkgrel='1'
pkgdesc='Command line tool for Perl code refactoring'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
  'perl'
  'perl-class-load'
  'perl-file-find-rule'
  'perl-io-interactive'
  'perl-path-class'
  'perl-ppi'
)
makedepends=('perl-module-build')
checkdepends=(
  'perl-test-class'
  'perl-test-mock-guard'
)
url='https://metacpan.org/release/App-PRT'
source=('https://cpan.metacpan.org/authors/id/H/HI/HITODE/App-PRT-0.20.tar.gz')
md5sums=('8719ccd7a7c431014dcf6dbbae87c9fb')
sha512sums=('d6ca9354610f75cc5dd691c2a8bce988f7b96f487272b68e76c1d75c10ef2f424996cf27541c97a0c305fc791029434002410a5dd301376f317d530d739a976f')
_distdir="App-PRT-0.20"

build() {
   export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    ./Build
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  ./Build test
}

package() {
  cd "$srcdir/$_distdir"
  ./Build install
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete 
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
