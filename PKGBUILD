# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-gtk3'
pkgver='0.023'
pkgrel='1'
pkgdesc="Perl interface to the 3.x series of the gtk+ toolkit"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gtk3' 'perl-cairo-gobject>=1.000' 'perl-glib-object-introspection>=0.016')
makedepends=()
checkdepends=('ttf-dejavu' 'xorg-server-xvfb')
url='https://metacpan.org/release/Gtk3'
source=('http://search.cpan.org/CPAN/authors/id/X/XA/XAOC/Gtk3-0.023.tar.gz')
md5sums=('6688b2aa6a9ad884cf68c2e3bb8aee6b')
sha512sums=('7b028426e7b70c2932babc9dc02e9d31214e82dd5e3ea129fc179c46baebe9987c038fe7d8c5f038cb01655747dcbd9afe4ade7625af88216ea1b4ccff2333f2')
_distdir="Gtk3-0.023"

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
