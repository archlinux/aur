# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-plack-middleware-session'
pkgver='0.34'
pkgrel='1'
pkgdesc="Middleware for session management"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cookie-baker' 'perl-digest-hmac' 'perl-digest-sha1' 'perl-http-cookies' 'perl-plack>=0.9910' 'perl-libwww')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-test-fatal>=0.006' 'perl-test-requires' 'perl-test-tcp' 'perl-yaml' 'perl-dbi' 'perl-dbd-sqlite')
url='https://metacpan.org/release/Plack-Middleware-Session'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Plack-Middleware-Session-0.34.tar.gz')
md5sums=('77ebd014f7f89979c55f169b3d26c294')
sha512sums=('8ad53048c887324e3acbac6700c9a5487328b62b722e7a923db7f90ce58cb2312bf332c55904b759afa4750798fc1a8a7bc8384a0eddf4d66bb2a8d92fb9c22f')
_distdir="Plack-Middleware-Session-0.34"

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
