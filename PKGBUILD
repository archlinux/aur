# Maintainer: Ordoban <dirk.langer@vvovgonik.de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-gtk3'
pkgver='0.033'
pkgrel='1'
pkgdesc="Perl interface to the 3.x series of the gtk+ toolkit"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gtk3' 'perl-cairo-gobject>=1.000' 'perl-glib-object-introspection>=0.016')
makedepends=()
checkdepends=('ttf-dejavu' 'xorg-server-xvfb')
url='https://metacpan.org/release/Gtk3'
source=('http://search.cpan.org/CPAN/authors/id/X/XA/XAOC/Gtk3-0.033.tar.gz')
md5sums=('1e7ec88cc2e306060deca852ea6323a2')
sha512sums=('081caf5808647081346d7c8b5d492a19dc2cd2e03a319b92344d41b54954f5c61eacdf20cc2d127a02e29277bfdc3799f852336bc61ee153b05e2d19e7b8afd2')
_distdir="Gtk3-0.033"

build() {
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" make test
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
