# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-storable'
pkgver=3.14
pkgrel=1
pkgdesc='Storable - persistence for Perl data structures'
url='https://metacpan.org/pod/Storable'
arch=('any')
license=('PerlArtistic' 'GPL2')
options=('!emptydirs')
depends=('perl')
makedepends=()
source=("https://github.com/rurban/Storable/archive/${pkgver}_04.tar.gz")
md5sums=('SKIP')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/Storable-3.14_04"
    perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/Storable-3.14_04"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/Storable-3.14_04"
  make install
  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}