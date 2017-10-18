# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-strict'
pkgver='0.39'
pkgrel='1'
pkgdesc="Perl/CPAN Module Test::Strict: Check syntax, presence of use strict; and test coverage"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-cover>=0.43' 'perl-io-stringy' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Test-Strict'
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MANWAR/Test-Strict-$pkgver.tar.gz")
md5sums=('a577d9e1b3fd61b5736e8d58e37eb7f9')
sha512sums=('9d21c0cf7e9982649bfd67152a8d77c60ef3f4d1044331feb2614786685f551f7d22c4b004c2b15515b1edde6d77417af2988394b4a91c30713ae4598c24dbb1')
_distdir="Test-Strict-$pkgver"

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
