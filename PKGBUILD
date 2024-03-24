# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-directory-scratch'
pkgver='0.18'
pkgrel='1'
pkgdesc="Easy-to-use self-cleaning scratch space."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-path-class' 'perl-path-tiny')
makedepends=()
url='http://search.cpan.org/dist/Directory-Scratch'
source=('https://cpan.metacpan.org/authors/id/E/ET/ETHER/Directory-Scratch-0.18.tar.gz')
md5sums=('66ea2b47c1bb184b08ba562d14727fb4')
sha512sums=('46fecf0c5b43cfac749e33024bcf814e97c5c461086f0e2d6aebbf74b47cf4a428cfe4c6bacb16ca858a35a0ef653ca3b9ee26ba3ed6bebd152380dfb1fde7b7')
_distdir="Directory-Scratch-0.18"

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
