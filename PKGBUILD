# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor : y5nw <y5nw at outlook dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-tcl-tk'
pkgver='1.51'
pkgrel='2'
pkgdesc="Extension module for Perl giving access to Tk via the Tcl extension"
_dist='Tcl-Tk'
arch=('any')
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl-tcl>=1.11' 'perl>=5.006' 'tk')
makedepends=('xorg-server-xvfb')
checkdepends=('ttf-font')
url='https://metacpan.org/release/Tcl-Tk'
source=("http://search.cpan.org/CPAN/authors/id/V/VK/VKON/$_dist-$pkgver.tar.gz")
md5sums=('6d07a38eac44635c39635cef08dcd808')
sha512sums=('ec1794fff03a0264ef92c04e281a7b2c65235f18f5538c3281ad007264a3e2d5034bf5c7d29ab0aa4c32f1b1b9cf748b580df3512dd8ba80c08cffdd9f662a27')
_distdir="$_dist-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    xvfb-run /usr/bin/perl Makefile.PL
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
