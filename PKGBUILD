# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-x11-xlib'
pkgver='0.03'
pkgrel='1'
pkgdesc="Low-level access to the X11 library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'libx11>=1.6.3' 'libxext>=1.3.3' 'libxtst>=1.2.2')
makedepends=()
checkdepends=('ttf-dejavu' 'xorg-server-xvfb')
url='https://metacpan.org/release/X11-Xlib'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARKELLIS/X11-Xlib-0.03.tar.gz')
md5sums=('ea69fb750480da8353f0d16ad98865d8')
sha512sums=('14468736447189da9cce6cac8c999092a5d5ff84231c5528285003057877a49bdee341811f382e04cb16a670bc5c09586e41d763e8b8a9734d7432f7147bdff3')
_distdir="X11-Xlib-0.03"

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
    xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" make test
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
