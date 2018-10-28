# Maintainer: Maxim Polishchuk <mpolishchuck@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-carton'
pkgver='1.0.34'
pkgrel='1'
pkgdesc="Perl module dependency manager (aka Bundler for Perl)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
    'cpanminus>=1.703'
    'perl-class-tiny>=1.001'
    'perl-json>=2.53'
    'perl-module-cpanfile>=0.9031'
    'perl-module-reader>=0.002'
    'perl-path-tiny>=0.033'
    'perl-try-tiny>=0.09'
    'perl>=5.8.5'
)
makedepends=()
url='https://metacpan.org/release/Carton'
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Carton-v${pkgver}.tar.gz")
md5sums=('8015c850fcd4add507a39c4d55763bcd')
sha512sums=('6c34dd95f749a8fd91843a63c87b802f1bb967511e3737a58fa2d80360f36cb62db1d66f740921ec3d4d6c624872bd7aa9c146e5eccdb8ac58f6d0a300ddba9e')
_distdir="Carton-v${pkgver}"

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
