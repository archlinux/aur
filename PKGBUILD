# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: Alan Young <harleypig@gmail.com>

pkgname='perl-module-find'
pkgver=0.12
pkgrel=1
pkgdesc="Find and use installed modules in a (sub)category"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Module-Find'
source=(http://search.cpan.org/CPAN/authors/id/C/CR/CRENZ/Module-Find-$pkgver.tar.gz)
md5sums=('abd614f3ebca68b4e7cc474400a8c0f2')

build() {
  export MODULEBUILDRC=/dev/null                                \
         PERL5LIB=""                                            \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MB_OPT="--installdirs vendor"                     \
         PERL_MM_OPT="INSTALLDIRS=vendor"                       \
         PERL_MM_USE_DEFAULT=1

  cd "$srcdir"/Module-Find-$pkgver

  /usr/bin/perl Makefile.PL
  make
}

check() {
  export MODULEBUILDRC=/dev/null                                \
         PERL5LIB=""                                            \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MB_OPT="--installdirs vendor"                     \
         PERL_MM_OPT="INSTALLDIRS=vendor"                       \
         PERL_MM_USE_DEFAULT=1

  cd "$srcdir"/Module-Find-$pkgver

  make test
}

package() {
  export MODULEBUILDRC=/dev/null                                \
         PERL5LIB=""                                            \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MM_USE_DEFAULT=1

  cd "$srcdir"/Module-Find-$pkgver

  make DESTDIR="$pkgdir" install
}
