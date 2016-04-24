# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-www-webkit'
pkgver='0.07'
pkgrel='1'
pkgdesc="Perl extension for controlling an embedding WebKit engine"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('cairo>=1.14.6' 'gdk-pixbuf2>=2.34.0' 'glib-perl' 'glib2>=2.48.0' 'pango>=1.40.1' 'perl-gtk3' 'perl-gtk3-webkit>=0.02' 'perl-moose' 'perl-uri' 'perl-x11-xlib')
makedepends=()
checkdepends=('ttf-dejavu' 'xorg-server-xvfb')
url='https://metacpan.org/release/WWW-WebKit'
source=('http://search.cpan.org/CPAN/authors/id/N/NI/NINE/WWW-WebKit-0.07.tar.gz')
md5sums=('05b0cf9406527ea534aa048e6a0dd401')
sha512sums=('ee7bab7730a9da18b9594e77f9dc5a84d8f9e724a3fcad78034f5997dec6b85e0a33c02355bb025b959ad8cfa530e9dab4a4e50025bb8573f041beec1e93fb36')
_distdir="WWW-WebKit-0.07"

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
