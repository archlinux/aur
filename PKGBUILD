# Contributor: Nathaniel Clark <my full dot name at misrule dot us>

pkgname='perl-cache-memcached-fast-safe'
pkgver='0.06'
pkgrel='1'
pkgdesc="Cache::Memcached::Fast with sanitizing keys and fork-safe"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cache-memcached-fast' 'perl-digest-sha' 'perl-posix-atfork')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-test-tcp' 'perl-test-skip-unlessexistsexecutable' 'perl-proc-guard')
url='https://metacpan.org/pod/Cache::Memcached::Fast::Safe'
source=("https://cpan.metacpan.org/authors/id/K/KA/KAZEBURO/Cache-Memcached-Fast-Safe-$pkgver.tar.gz")
md5sums=('0458c0443909c5c4fbea0c0bac09217e')
sha512sums=('1dabc9ea7b846570d04460a9e3e22b06d1561975c41da490aeaa938b6d977ac58ae8523b99317ef11d6849d301db5b3f202bc38758c32152681af74b98cd52a6')
_distdir="Cache-Memcached-Fast-Safe-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    ./Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    ./Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  ./Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
