# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-lwp-useragent-mockable'
pkgver='1.10'
pkgrel='1'
pkgdesc="Permits recording, and later playing back of LWP requests."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-hook-lexwrap>=0' 'perl-uri>=0' 'perl-libwww>=0')
makedepends=()
url='https://metacpan.org/release/LWP-UserAgent-Mockable'
source=('http://search.cpan.org/CPAN/authors/id/M/MM/MMORGAN/LWP-UserAgent-Mockable-1.10.tgz' 'cpan_100193.patch')
md5sums=('00a3405074317b06d0c69a4882cdf188'
         '1e7908c8b6afc9fba5e94e8d61dce751')
sha512sums=('205c398995d7fc0577defbb5dffe952e027f285a5d0f104dae867bc142f8fb0308d803d794b6a22c576ce2b61b7d2fb45c30a1771c788a4939c1f1073a8be820'
            '5ae228dabe64cf95361bcb9ca248b07b13ee7ef388c77d33de54a5ef3d2afaf444fa13248357c80e6ffb653c37f3bec0039fe0b58472de65fa8f43740ab6f8d8')
_distdir="LWP-UserAgent-Mockable"

prepare() {
  cd "${srcdir}"/${_distdir}
  patch -Np1 -i "${srcdir}"/cpan_100193.patch
}

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
