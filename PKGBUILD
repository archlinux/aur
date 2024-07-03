# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-tkx'
pkgver='1.10'
pkgrel='4'
pkgdesc="Yet another Tk interface"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-tcl>=1' 'tk')
checkdepends=('xorg-server-xvfb' 'ttf-font')
url='http://search.cpan.org/dist/Tkx'
source=('https://cpan.metacpan.org/authors/id/C/CA/CAC/Tkx-1.10.tar.gz')
md5sums=('edbb92ced28998612fd1e3a864be0887')
sha512sums=('95264a6cf0894f69dbc26c48e7e8772383c64aa9c2f5fc037a7f57a608ae1309f5a9f7570abfa5f0570a43b2a977594ee9caaacfeef48f9370fc4d99087f7dac')
_distdir="Tkx-1.10"

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
    xvfb-run make test
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
