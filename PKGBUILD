# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-module-bundled-files'
pkgver='0.03'
pkgrel='1'
pkgdesc="Perl/CPAN Module Module::Bundled::Files: Access files bundled with Module"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-isa' 'perl-module-build>=0.26')
makedepends=()
url='https://metacpan.org/release/Module-Bundled-Files'
source=("http://search.cpan.org/CPAN/authors/id/P/PC/PCAMPBELL/Module-Bundled-Files-$pkgver.tar.gz")
md5sums=('bcefaf9448046a0d379775216027bfd7')
sha512sums=('d61f6de2522fe1e877607eb945cb4769524e0444dc58e68fdb794de00c8d5eed2206b600c651d595a49912ae7da2643a68d8e14ee5e8c4599cdf7e8d249de048')
_distdir="Module-Bundled-Files-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
