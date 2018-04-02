# Maintainer: Maxim Polishchuck <mpolishchuck@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-carton'
pkgver='1.0.28'
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
md5sums=('77e0e6c668451b0e82b20f4928589e61')
sha512sums=('6b9484139b32717ab7f478a5ac81954e7f8691aefabc989894476613e6e6d63a14e8c79c252ccf1a819fbd3adc4d0184e24c0fd87f4737f83e417b7149a196d4')
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
