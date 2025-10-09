# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname='perl-apache-session-browseable'
pkgver='1.3.18'
pkgrel='1'
pkgdesc="Add index and search methods to Apache::Session"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-apache-session' 'perl-json')
makedepends=('perl-module-build')
#checkdepends=('perl-test-time')
url='https://metacpan.org/dist/Apache-Session-Browseable'
_distdir="Apache-Session-Browseable-${pkgver}"
source=("https://cpan.metacpan.org/authors/id/G/GU/GUIMARD/${_distdir}.tar.gz")
md5sums=('9bc8798d59c6efd3cfc60ff4dd2e99d9')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

