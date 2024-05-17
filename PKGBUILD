# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-plack-middleware-debug'
pkgver='0.18'
pkgrel='2'
pkgdesc="display information about the current request/response"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-class-method-modifiers>=1.05' 'perl-data-dump' 'perl-data-dumper-concise' 'perl-file-sharedir>=1.00' 'perl-plack' 'perl-text-microtemplate>=0.15')
makedepends=('perl-module-build-tiny')
url='http://search.cpan.org/dist/Plack-Middleware-Debug'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Plack-Middleware-Debug-0.18.tar.gz')
md5sums=('986abef34388a1a422c15e377c64b501')
sha512sums=('802a9aafbebf7a0bcd49c82ab64f240444369128d45b52c6602ce740fe664d7eaec7d27fa17daf946182de0cc4ac73421c9f467dda897c270c5c3d933d39130a')
_distdir="Plack-Middleware-Debug-0.18"

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
